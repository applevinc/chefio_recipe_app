import 'dart:developer';

import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInDataSource implements ISignInDataSource {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _getUserDataFromFirestore(credential);
    } catch (e) {
      log(e.toString());

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            throw Failure('No user found for that email.');
          case 'wrong-password':
            throw Failure('Wrong password provided for that user.');
          default:
            throw InternalFailure();
        }
      }

      if (e is EmailVerificationFailure) {
        rethrow;
      }

      if (e is InCompleteProfileFailure) {
        rethrow;
      }

      throw InternalFailure();
    }
  }

  Future<void> _getUserDataFromFirestore(UserCredential userCredential) async {
    final user = userCredential.user;

    if (user == null) {
      throw InternalFailure();
    }

    final result = await usersCollection.doc(user.uid).get();
    final data = result.data();

    if (data == null) {
      throw InternalFailure();
    }

    final authUser = UserModel.fromDataSource(map: data);
    AppSession.authUser = authUser.copyWith(
      isEmailVerified: user.emailVerified,
    );

    if (!user.emailVerified) {
      await userCredential.user?.sendEmailVerification();

      throw EmailVerificationFailure();
    }

    await usersCollection.doc(user.uid).update({'is_email_verified': true});

    if (!authUser.hasCompletedProfile) {
      throw InCompleteProfileFailure();
    }
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/common/services/firebase_storage.dart';
import 'package:chefio_recipe_app/common/services/firestore_collections.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/features/auth/data/data_sources/sign_up/i_sign_up_data_source.dart';
import 'package:chefio_recipe_app/features/auth/data/models/confirm_sign_up_request.model.dart';
import 'package:chefio_recipe_app/features/auth/data/models/create_profile_request.model.dart';
import 'package:chefio_recipe_app/features/auth/data/models/sign_up_request.model.dart';
import 'package:chefio_recipe_app/features/auth/data/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpDataSource implements ISignUpDataSource {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> signUp(SignUpRequestModel request) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      await Future.wait([
        _sendVerificationEmail(userCredential),
        _saveNewUserToFirestore(userCredential),
      ]);
    } catch (e) {
      log(e.toString());

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'weak-password':
            throw Failure('The password provided is too weak.');
          case 'email-already-in-use':
            throw Failure('An account already exists for that email.');
          case 'invalid-email':
            throw Failure('The email address is badly formatted.');
          default:
            throw InternalFailure();
        }
      } else {
        throw InternalFailure();
      }
    }
  }

  Future<void> _sendVerificationEmail(UserCredential userCredential) async {
    await userCredential.user?.sendEmailVerification();
  }

  Future<void> _saveNewUserToFirestore(UserCredential userCredential) async {
    final user = userCredential.user;

    if (user == null) {
      throw InternalFailure();
    }

    final userModel = UserModel(
      id: user.uid,
      email: user.email,
      isEmailVerified: user.emailVerified,
    );

    await usersCollection.doc(user.uid).set(userModel.toMap());
    AppSession.authUser = userModel;
  }

  @override
  Future<void> createProfile(CreateProfileRequestModel request) async {
    final photoUrl = await _uploadProfileImage(request.image);
    final map = request.toMap();
    map.addAll({'photoUrl': photoUrl});
    await usersCollection.doc('${AppSession.authUser?.id}').update(map);
  }

  Future<String> _uploadProfileImage(File file) async {
    final ref = profilePicturesStorage.child('${AppSession.authUser?.id}');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  @override
  Future<void> confirmSignUp(ConfirmSignUpRequestModel request) async {
    // TODO: implement confirmSignUp
    throw UnimplementedError();
  }

  @override
  Future<void> resendOtp({required String email}) async {
    // TODO: implement resendOtp
    throw UnimplementedError();
  }
}

import 'dart:developer';

import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/confirm_forgot_password_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/reset_password_request.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordDataSource implements IForgotPasswordDataSource {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> sendOtp({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            throw Failure('No user found for that email.');
          case 'invalid-email':
            throw Failure('The email address is badly formatted.');
          default:
            throw InternalFailure();
        }
      }

      throw InternalFailure();
    }
  }

  @override
  Future<void> confirm(ConfirmForgotPasswordRequestModel request) {
    // TODO: implement confirm
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel request) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}

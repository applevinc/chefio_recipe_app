import 'package:chefio_recipe_app/modules/auth/domain/entities/sign_up.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/password_strength/password_strength.controller.dart';
import 'package:flutter/material.dart';

class SignUpController extends PasswordStrengthController {
  SignUpController({required ISignUpRepository signUpRepository}) {
    _signUpRepository = signUpRepository;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late final ISignUpRepository _signUpRepository;

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  Future<void> execute() async {
    final request = SignUpRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      setBusy(true);
      await _signUpRepository.signUp(request);
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

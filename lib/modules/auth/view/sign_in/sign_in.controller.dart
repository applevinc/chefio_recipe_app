import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_in.repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';
import 'package:flutter/material.dart';

class SignInController extends ViewController {
  SignInController({required ISignInRepository signInRepository}) {
    _signInRepository = signInRepository;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late final ISignInRepository _signInRepository;

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  Future<void> execute() async {
    try {
      setBusy(true);
      await _signInRepository.signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
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

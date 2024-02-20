import 'package:chefio_recipe_app/modules/auth/data/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_sign_in.repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';
import 'package:flutter/material.dart';

class SignInController extends BaseController {
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

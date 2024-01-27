import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';
import 'package:flutter/material.dart';

class SignInController extends BaseController {
  SignInController({required IAuthService authService}) {
    _authService = authService;
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  late final IAuthService _authService;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  Future<void> execute() async {
    try {
      setBusy(true);
      await _authService.signIn(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

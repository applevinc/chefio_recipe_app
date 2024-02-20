import 'dart:io';

import 'package:chefio_recipe_app/modules/auth/screens/password_strength/password_strength.controller.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:flutter/material.dart';

class SignUpController extends PasswordStrengthController {
  SignUpController({required IAuthService authService}) {
    _authService = authService;
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late final IAuthService _authService;

  late final TextEditingController firstNameController;

  late final TextEditingController lastNameController;

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  File? _image;

  File? get image => _image;

  Future<void> execute() async {
    try {
      setBusy(true);
      await _authService.signUp(
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

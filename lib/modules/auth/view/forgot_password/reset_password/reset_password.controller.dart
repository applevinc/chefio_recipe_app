import 'package:chefio_recipe_app/modules/auth/view/password_strength/password_strength.controller.dart';
import 'package:chefio_recipe_app/modules/auth/data/interfaces/i_auth_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordController extends PasswordStrengthController {
  ResetPasswordController({required IAuthService authService}) {
    _authService = authService;
    textController = TextEditingController();
  }

  late final IAuthService _authService;

  late final TextEditingController textController;

  Future<void> execute() async {
    try {
      setBusy(true);
      await _authService.resetPassword(newPassword: textController.text.trim());
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

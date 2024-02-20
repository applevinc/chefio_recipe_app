import 'package:chefio_recipe_app/modules/auth/domain/entities/reset_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/password_strength/password_strength.controller.dart';
import 'package:flutter/material.dart';

class ResetPasswordController extends PasswordStrengthController {
  ResetPasswordController({required IForgotPasswordRepository forgotPasswordRepository}) {
    _forgotPasswordRepository = forgotPasswordRepository;
    textController = TextEditingController();
  }

  late final IForgotPasswordRepository _forgotPasswordRepository;

  late final TextEditingController textController;

  Future<void> execute() async {
    final request = ResetPasswordRequest(newPassword: textController.text.trim());

    try {
      setBusy(true);
      await _forgotPasswordRepository.resetPassword(request);
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

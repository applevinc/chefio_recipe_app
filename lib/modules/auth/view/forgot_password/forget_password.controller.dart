import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ViewController {
  ForgotPasswordController(
      {required IForgotPasswordRepository forgotPasswordRepository}) {
    _forgotPasswordRepository = forgotPasswordRepository;
    emailController = TextEditingController();
  }

  late final IForgotPasswordRepository _forgotPasswordRepository;

  late final TextEditingController emailController;

  Future<void> execute() async {
    try {
      setBusy(true);
      await _forgotPasswordRepository.sendOtp(email: emailController.text.trim());
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

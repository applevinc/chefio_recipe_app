import 'package:chefio_recipe_app/modules/auth/data/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends BaseController {
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

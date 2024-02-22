import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/confirmation/confirm_forgot_password.controller.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/reset_password/reset_password.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/otp/otp.screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmForgotPasswordScreen extends StatelessWidget {
  const ConfirmForgotPasswordScreen({super.key, required this.email});

  static String route = '/confirm_forgot_password';

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmForgotPasswordController(
        forgotPasswordRepository: locator<IForgotPasswordRepository>(),
        email: email,
      ),
      child: const _ConfirmForgotPasswordScreen(),
    );
  }
}

class _ConfirmForgotPasswordScreen extends StatelessWidget {
  const _ConfirmForgotPasswordScreen();

  @override
  Widget build(BuildContext context) {
    return OTPScreen<ConfirmForgotPasswordController>(
      nextRoute: ResetPasswordScreen.route,
    );
  }
}

import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/confirmation/confirm_forgot_password.controller.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/reset_password/reset_password.screen.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/screens/otp/otp.screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmForgotPasswordScreen extends StatelessWidget {
  const ConfirmForgotPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmForgotPasswordViewModel(
        authService: locator<IAuthService>(),
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
    return const OTPScreen<ConfirmForgotPasswordViewModel>(
      nextScreen: ResetPasswordScreen(),
    );
  }
}

import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_up/confirmation/confirm_signup.controller.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/screens/otp/otp.screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpScreen extends StatelessWidget {
  const ConfirmSignUpScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmSignUpController(
        authService: locator<IAuthService>(),
        email: email,
      ),
      child: const _ConfirmSignUpScreen(),
    );
  }
}

class _ConfirmSignUpScreen extends StatelessWidget {
  const _ConfirmSignUpScreen();

  @override
  Widget build(BuildContext context) {
    return const OTPScreen<ConfirmSignUpController>(nextScreen: SignInScreen());
  }
}

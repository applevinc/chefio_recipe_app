import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/confirmation/confirm_signup.controller.dart';
import 'package:chefio_recipe_app/modules/auth/view/otp/otp.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/create_profile/create_profile.screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpScreen extends StatelessWidget {
  const ConfirmSignUpScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmSignUpController(
        signUpRepository: locator<ISignUpRepository>(),
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
    return const OTPScreen<ConfirmSignUpController>(nextRoute: CreateProfileScreen());
  }
}

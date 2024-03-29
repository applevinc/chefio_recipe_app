import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/confirmation/confirm_signup.controller.dart';
import 'package:chefio_recipe_app/features/auth/view/otp/otp.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/create_profile/create_profile.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/sign_up.screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpScreen extends StatelessWidget {
  const ConfirmSignUpScreen({super.key, required this.email});

  static String routeName = 'confirm_signup';

  static String route = '${SignUpScreen.route}/$routeName';

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
    return OTPScreen<ConfirmSignUpController>(nextRoute: CreateProfileScreen.route);
  }
}

import 'package:chefio_recipe_app/common/views/onboarding/onboarding.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/confirmation/confirm_forgot_password.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/forgot_password.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/reset_password/reset_password.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/confirmation/confirm_signup.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/sign_up.screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: OnboardingScreen.route,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: SignInScreen.route,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: SignUpScreen.route,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: ConfirmSignUpScreen.route,
      builder: (context, state) {
        final email = state.extra as String;
        return ConfirmSignUpScreen(email: email);
      },
    ),
    GoRoute(
      path: ForgotPasswordScreen.route,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: ConfirmForgotPasswordScreen.route,
      builder: (context, state) {
        final email = state.extra as String;
        return ConfirmForgotPasswordScreen(email: email);
      },
    ),
    GoRoute(
      path: ResetPasswordScreen.route,
      builder: (context, state) => const ResetPasswordScreen(),
    ),
  ],
);

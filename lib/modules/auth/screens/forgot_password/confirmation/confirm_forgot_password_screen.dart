import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/confirmation/confirm_forgot_password_viewmodel.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/reset_password/reset_password_screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/reset_password/reset_password_viewmodel.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/otp_screen.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmForgotPasswordScreen extends StatelessWidget {
  const ConfirmForgotPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmForgotPasswordViewModel(
          authService: locator<IAuthService>(), email: email),
      child: const _ConfirmForgotPasswordScreen(),
    );
  }
}

class _ConfirmForgotPasswordScreen extends StatefulWidget {
  const _ConfirmForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<_ConfirmForgotPasswordScreen> createState() =>
      _ConfirmForgotPasswordScreenState();
}

class _ConfirmForgotPasswordScreenState extends State<_ConfirmForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void init() {
    context.read<ConfirmForgotPasswordViewModel>().initTimer();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context
            .read<ConfirmForgotPasswordViewModel>()
            .execute(pin: controller.text);

        if (mounted) {
          AppNavigator.to(
            context,
            ChangeNotifierProvider(
              create: (context) =>
                  ResetPasswordViewModel(authService: locator<IAuthService>()),
              child: const ResetPasswordScreen(),
            ),
          );
        }
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  void resendOtp() async {
    try {
      await context.read<ConfirmForgotPasswordViewModel>().resendOtp();

      if (!mounted) return;

      Messenger.success(context: context, message: 'Token has been sent to your email');
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ConfirmForgotPasswordViewModel>();

    return Form(
      key: _formKey,
      child: OTPScreen(
        controller: controller,
        time: viewModel.timeLeft,
        resend: resendOtp,
        verify: submit,
        isResending: viewModel.busy(ConfirmForgotPasswordLoadingState.resend),
        isVerifying: viewModel.busy(ConfirmForgotPasswordLoadingState.verify),
      ),
    );
  }
}

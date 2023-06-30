import 'package:chefio_recipe_app/src/config/locator/locator.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/forgot_password/confirmation/confirm_forgot_password_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/forgot_password/reset_password/reset_password_screen.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/forgot_password/reset_password/reset_password_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/otp_screen.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmForgotPasswordScreen extends StatefulWidget {
  const ConfirmForgotPasswordScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<ConfirmForgotPasswordScreen> createState() => _ConfirmForgotPasswordScreenState();
}

class _ConfirmForgotPasswordScreenState extends State<ConfirmForgotPasswordScreen> {
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
        await context.read<ConfirmForgotPasswordViewModel>().execute(pin: controller.text);

        if (mounted) {
          AppNavigator.to(
            context,
            ChangeNotifierProvider(
              create: (context) => ResetPasswordViewModel(authService: locator<IAuthService>()),
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
      await context.read<ConfirmForgotPasswordViewModel>().resendOtp(email: widget.email);
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

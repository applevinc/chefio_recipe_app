import 'package:chefio_recipe_app/src/modules/auth/screens/sign_in/sign_in_screen.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_up/confirmation/confirm_signup_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/otp_screen.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:chefio_recipe_app/src/shared/utils/messenger.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpScreen extends StatefulWidget {
  const ConfirmSignUpScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<ConfirmSignUpScreen> createState() => _ConfirmSignUpScreenState();
}

class _ConfirmSignUpScreenState extends State<ConfirmSignUpScreen> {
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
    context.read<ConfirmSignUpViewModel>().initTimer();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<ConfirmSignUpViewModel>().execute(pin: controller.text);

        if (mounted) {
          AppNavigator.to(context, const SignInScreen());
        }
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  void resendOtp() async {
    try {
      await context.read<ConfirmSignUpViewModel>().resendOtp(email: widget.email);
      Messenger.success(context: context, message: 'Token has been sent to your email');
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ConfirmSignUpViewModel>();

    return Form(
      key: _formKey,
      child: OTPScreen(
        controller: controller,
        verify: submit,
        time: viewModel.timeLeft,
        resend: resendOtp,
        isResending: viewModel.busy(ConfirmSignUpLoadingState.resend),
        isVerifying: viewModel.busy(ConfirmSignUpLoadingState.verify),
      ),
    );
  }
}

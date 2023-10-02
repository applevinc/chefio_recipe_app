import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_in/sign_in_screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_up/confirmation/confirm_signup_viewmodel.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/otp_screen.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpScreen extends StatelessWidget {
  const ConfirmSignUpScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmSignUpViewModel(
        authService: locator<IAuthService>(),
        email: email,
      ),
      child: const _ConfirmSignUpScreen(),
    );
  }
}

class _ConfirmSignUpScreen extends StatefulWidget {
  const _ConfirmSignUpScreen({Key? key}) : super(key: key);

  @override
  State<_ConfirmSignUpScreen> createState() => _ConfirmSignUpScreenState();
}

class _ConfirmSignUpScreenState extends State<_ConfirmSignUpScreen> {
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

        if (!mounted) return;

        AppNavigator.pushAndRemoveUntil(context, const SignInScreen());
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  void resendOtp() async {
    try {
      await context.read<ConfirmSignUpViewModel>().resendOtp();

      if (!mounted) return;

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

import 'package:chefio_recipe_app/src/modules/auth/screens/sign_up/confirmation/confirm_signup_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/otp_screen.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpScreen extends StatefulWidget {
  const ConfirmSignUpScreen({Key? key}) : super(key: key);

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
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<ConfirmSignUpViewModel>().execute(pin: controller.text);

        if (mounted) {}
      } on Failure catch (e) {
        Messenger.error(context, message: e.message);
      }
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
        time: '',
        resend: () {},
      ),
    );
  }
}

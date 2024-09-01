import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/forget_password.controller.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordController(
        forgotPasswordRepository: locator<IForgotPasswordRepository>(),
      ),
      child: const _ForgotPasswordScreen(),
    );
  }
}

class _ForgotPasswordScreen extends StatefulWidget {
  const _ForgotPasswordScreen();

  @override
  State<_ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<_ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<ForgotPasswordController>().execute();

        if (!mounted) {
          return;
        }

        Messenger.success(context: context, message: 'Check your email to reset password');
        context.go(const SignInScreen());
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();

    return AuthView(
      title: 'Password recovery',
      subtitle: 'Enter your email to recover your password',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Email',
              prefixIcon: const TextFieldIcon(icon: AppIcons.email),
              controller: controller.emailController,
              validator: Validator.validateEmail,
            ),
            SizedBox(height: 24.h),
            AppButton(
              label: 'Submit',
              isBusy: controller.isBusy,
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }
}

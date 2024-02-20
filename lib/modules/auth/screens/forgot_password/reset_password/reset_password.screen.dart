import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/reset_password/reset_password.controller.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';

import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/password_strength/password_strength.component.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/password_textfield.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordController(
        authService: locator<IAuthService>(),
      ),
      child: const _ResetPasswordScreen(),
    );
  }
}

class _ResetPasswordScreen extends StatefulWidget {
  const _ResetPasswordScreen();

  @override
  State<_ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<_ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<ResetPasswordController>().execute();

        if (!mounted) {
          return;
        }

        AppNavigator.pushAndRemoveUntil(context, const SignInScreen());
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ResetPasswordController>();

    return AuthView(
      title: 'Reset your password',
      subtitle: 'Please enter your new password',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            PasswordTextField(
              controller: viewModel.textController,
              onChanged: (value) => viewModel.validate(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }

                return null;
              },
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Password must contain:',
                style: AppText.bold500(context).copyWith(
                  fontSize: 17.sp,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            const PasswordStrengthComponent<ResetPasswordController>(),
            SizedBox(height: 24.h),
            AppButton(
              label: 'Done',
              isBusy: viewModel.isBusy,
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/reset_password/reset_password_viewmodel.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/styles/colors.dart';

import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/password_validator/password_strength_component.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/password_textfield.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context
            .read<ResetPasswordViewModel>()
            .execute(password: passwordController.text.trim());

        if (!mounted) return;

        AppNavigator.pushAndRemoveUntil(context, const SignInScreen());
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ResetPasswordViewModel>();

    return AuthView(
      title: 'Reset your password',
      subtitle: 'Please enter your new password',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            PasswordTextField(
              controller: passwordController,
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.mainText,
                      fontSize: 17.sp,
                    ),
              ),
            ),
            SizedBox(height: 16.h),
            PasswordStrengthComponent(
              containsNumber: viewModel.containsNumber,
              containsSixCharacters: viewModel.containsSixCharacters,
            ),
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

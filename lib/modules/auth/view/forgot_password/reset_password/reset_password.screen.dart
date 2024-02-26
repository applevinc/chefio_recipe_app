import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/forgot_password.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/forgot_password/reset_password/reset_password.controller.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';

import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/password_strength/password_strength.component.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/password_textfield.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  static String routeName = 'reset_password';

  static String route = '${ForgotPasswordScreen.route}/$routeName';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordController(
        forgotPasswordRepository: locator<IForgotPasswordRepository>(),
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

        context.go(SignInScreen.route);
        Messenger.success(context: context, message: 'Reset password successful');
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

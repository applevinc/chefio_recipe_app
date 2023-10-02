import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/confirmation/confirm_forgot_password_screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/forgot_password/forget_password_viewmodel.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/utils/messenger.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordViewModel(
        authService: locator<IAuthService>(),
      ),
      child: const _ForgotPasswordScreen(),
    );
  }
}

class _ForgotPasswordScreen extends StatefulWidget {
  const _ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<_ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<_ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context
            .read<ForgotPasswordViewModel>()
            .execute(email: emailController.text.trim());

        if (mounted) {
          AppNavigator.to(
            context,
            ConfirmForgotPasswordScreen(email: emailController.text.trim()),
          );
        }
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ForgotPasswordViewModel>();

    return AuthView(
      title: 'Password recovery',
      subtitle: 'Enter your email to recover your password',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Email or phone number',
              prefixIcon: const TextFieldIcon(icon: AppIcons.email),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            AppButton(
              label: 'Submit',
              isBusy: viewModel.isBusy,
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }
}

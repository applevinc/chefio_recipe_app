import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/password_textfield.dart';
import 'package:chefio_recipe_app/common/widgets/others/loading_overlay_view.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/features/auth/view/password_strength/password_strength.component.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/confirmation/confirm_signup.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/sign_up.controller.dart';
import 'package:chefio_recipe_app/features/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const route = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpController(
        signUpRepository: locator<ISignUpRepository>(),
      ),
      child: const _SignUpScreen(),
    );
  }
}

class _SignUpScreen extends StatefulWidget {
  const _SignUpScreen();

  @override
  State<_SignUpScreen> createState() => __SignUpScreenState();
}

class __SignUpScreenState extends State<_SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        final controller = context.read<SignUpController>();
        await controller.execute();

        if (!mounted) {
          return;
        }

        final email = controller.emailController.text.trim();
        context.push(ConfirmSignUpScreen.route, extra: email);
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignUpController>();

    return LoadingOverlayView(
      showOverLay: controller.isBusy,
      child: AuthView(
        title: 'Sign up',
        subtitle: 'Create your account',
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
              SizedBox(height: 16.h),
              PasswordTextField(
                controller: controller.passwordController,
                onChanged: (value) => controller.validate(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
              ),
              SizedBox(height: 24.h),
              const PasswordStrengthComponent<SignUpController>(),
              SizedBox(height: 24.h),
              AppButton(label: 'Sign Up', onPressed: submit),
            ],
          ),
        ),
      ),
    );
  }
}

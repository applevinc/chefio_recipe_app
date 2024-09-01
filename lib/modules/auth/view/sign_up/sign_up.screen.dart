import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/password_textfield.dart';
import 'package:chefio_recipe_app/core/widgets/others/loading_overlay_view.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/password_strength/password_strength.component.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/create_profile/create_profile.screen.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/sign_up.controller.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
        Messenger.success(context: context, message: 'Verification link has been sent to $email');
        context.push(const CreateProfileScreen());
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

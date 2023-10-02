import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_up/confirmation/confirm_signup_screen.dart';
import 'package:chefio_recipe_app/modules/auth/screens/sign_up/sign_up_viewmodel.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';

import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/modules/auth/screens/password_validator/password_strength_component.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/password_textfield.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(
        authService: locator<IAuthService>(),
      ),
      child: const _SignUpScreen(),
    );
  }
}

class _SignUpScreen extends StatefulWidget {
  const _SignUpScreen({Key? key}) : super(key: key);

  @override
  State<_SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<_SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<SignUpViewModel>().execute(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

        if (mounted) {
          AppNavigator.to(
            context,
            ConfirmSignUpScreen(email: emailController.text.trim()),
          );
        }
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Welcome!',
                          style: AppText.bold700(context).copyWith(
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Please enter your account here',
                          style: AppText.bold500(context).copyWith(
                            fontSize: 15.sp,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      CustomTextField(
                        hintText: 'Email or phone number',
                        prefixIcon: const TextFieldIcon(icon: AppIcons.email),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email or phone number';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
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
                          style: AppText.bold500(context).copyWith(
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      PasswordStrengthComponent(
                        containsNumber: viewModel.containsNumber,
                        containsSixCharacters: viewModel.containsSixCharacters,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  AppButton(
                    label: 'Sign Up',
                    isBusy: viewModel.isBusy,
                    onPressed: submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

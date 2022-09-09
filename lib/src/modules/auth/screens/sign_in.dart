import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/forgot_password.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_up.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 107.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome Back',
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
                  ),
                  SizedBox(height: 16.h),
                  PasswordTextField(controller: passwordController),
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {
                      AppNavigator.to(context, const ForgotPasswordScreen());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?',
                        style: AppText.bold500(context).copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 72.h),
                  CustomButton(
                    label: 'Login',
                    onPressed: () {
                      AppNavigator.to(context, const DashBoardView());
                    },
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Or continue with',
                      style: AppText.bold500(context).copyWith(
                        fontSize: 15.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomButtonWithIcon(
                    label: 'Google',
                    onPressed: () {},
                  ),
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {
                      AppNavigator.to(context, const SignUpScreen());
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t have any account? ',
                          style: AppText.bold500(context).copyWith(
                            fontSize: 16.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign Up',
                              style: AppText.bold700(context).copyWith(
                                fontSize: 16.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 41.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

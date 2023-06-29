import 'package:chefio_recipe_app/src/modules/auth/screens/otp_screen.dart';
import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/password_strength_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      ),
                      SizedBox(height: 16.h),
                      PasswordTextField(controller: passwordController),
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
                      const PasswordStrengthView(),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  AppButton(
                    label: 'Sign Up',
                    onPressed: () {
                      AppNavigator.to(context, const OTPScreen());
                    },
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

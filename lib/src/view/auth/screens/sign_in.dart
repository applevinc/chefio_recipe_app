import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/custom_button.dart';
import 'package:chefio_recipe_app/src/core/widgets/textfield.dart';
import 'package:chefio_recipe_app/src/view/auth/screens/forgot_password.dart';
import 'package:chefio_recipe_app/src/view/auth/screens/sign_up.dart';
import 'package:chefio_recipe_app/src/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:chefio_recipe_app/src/view/home/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(flex: 1.84.toInt()),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Welcome Back',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SizedBox(height: 8.0.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Please enter your account here',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        const CustomTextField(
                          hintText: 'Email or phone number',
                          prefixIcon: AppIcons.email,
                        ),
                        SizedBox(height: 16.h),
                        const CustomTextField(
                          hintText: 'Password',
                          prefixIcon: AppIcons.lock,
                          obscureText: true,
                        ),
                        SizedBox(height: 24.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: AppColors.mainText,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        CustomButton(
                          label: 'Login',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BottomNavBar(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Or continue with',
                            style: Theme.of(context).textTheme.bodyText1,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: 'Don’t have any account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: AppColors.mainText),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 41.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

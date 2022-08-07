import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/password_strength_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Welcome!',
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Your Password must contain:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColors.mainText, fontSize: 17.sp),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        const PasswordStrengthView(),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      label: 'Sign Up',
                      onPressed: () {},
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

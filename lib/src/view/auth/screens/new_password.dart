import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/app_colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/custom_button.dart';
import 'package:chefio_recipe_app/src/view/auth/screens/sign_in.dart';
import 'package:chefio_recipe_app/src/view/auth/widgets/password_strength_view.dart';
import 'package:chefio_recipe_app/src/view/auth/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
                            'Reset your password',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SizedBox(height: 8.0.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Please enter your new password',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        const AuthTextField(
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
                      label: 'Done',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),
                        );
                      },
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

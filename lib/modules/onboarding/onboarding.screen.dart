import 'package:chefio_recipe_app/assets/images.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';

import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppImages.onboarding,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            const Spacer(flex: 1),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Start Cooking',
                style: AppText.bold700(context).copyWith(
                  fontSize: 22.sp,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 220.w,
                child: Text(
                  'Let’s join our community to cook better food!',
                  style: AppText.bold500(context).copyWith(
                    fontSize: 17.sp,
                    color: AppColors.secondaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppButton(
                label: 'Get Started',
                onPressed: () {
                  context.go(const SignInScreen());
                },
              ),
            ),
            SizedBox(height: 38.h),
          ],
        ),
      ),
    );
  }
}

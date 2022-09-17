import 'package:chefio_recipe_app/src/shared/assets/images.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppImages.onboarding,
                width: MediaQuery.of(context).size.width,
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
              SizedBox(height: 16.0.h),
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
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: AppButton(
                  label: 'Get Started',
                  onPressed: () {
                    AppNavigator.pushAndRemoveUntil(context, const SignInScreen());
                  },
                ),
              ),
              SizedBox(height: 38.0.h),
            ],
          ),
        ),
      ),
    );
  }
}

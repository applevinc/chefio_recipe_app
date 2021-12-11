import 'package:chefio_recipe_app/src/core/assets/images.dart';
import 'package:chefio_recipe_app/src/core/widgets/custom_button.dart';
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
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(height: 16.0.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 209.w,
                  child: Text(
                    'Let’s join our community to cook better food!',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: CustomButton(
                  label: 'Get Started',
                  onPressed: () {},
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

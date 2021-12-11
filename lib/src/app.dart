import 'package:chefio_recipe_app/src/core/theme/theme.dart';
import 'package:chefio_recipe_app/src/view/auth/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: 'Chefio Recipe App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        home: const OnboardingScreen(),
      ),
    );
  }
}

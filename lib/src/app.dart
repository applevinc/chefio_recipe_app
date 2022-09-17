import 'package:chefio_recipe_app/src/shared/styles/theme.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefioApp extends StatelessWidget {
  const ChefioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => ProviderScope(
        child: MaterialApp(
          title: 'Chefio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultTheme,
          home: const OnboardingScreen(),
        ),
      ),
    );
  }
}

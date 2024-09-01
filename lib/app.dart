import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/onboarding/onboarding.screen.dart';
import 'package:chefio_recipe_app/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const appName = 'Chefio';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: locator<AppConfig>().appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const OnboardingScreen(),
      ),
    );
  }
}

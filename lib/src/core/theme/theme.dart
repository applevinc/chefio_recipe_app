import 'package:chefio_recipe_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline6: GoogleFonts.inter(
          color: AppColors.mainText,
          fontSize: 22.0.sp,
          letterSpacing: 0.5.sp,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: GoogleFonts.inter(
          color: AppColors.secondaryText,
          fontSize: 15.0.sp,
          letterSpacing: 0.5.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        height: 56.h,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          elevation: 0.0,
          minimumSize: Size(327.w, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: const MaterialColor(
          0xff7bed8d, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          <int, Color>{
            50: Color(0xffE9FAEC), //10%
            100: Color(0xffDDF9E1), //20%
            200: Color(0xffD1F7D7), //30%
            300: Color(0xffC4F6CC), //40%
            400: Color(0xffB8F4C2), //50%
            500: Color(0xffACF3B7), //60%
            600: Color(0xffA0F1AD), //70%
            700: Color(0xff93F0A2), //80%
            800: Color(0xff87EE98), //90%
            900: Color(0xff7BED8D), //100%
          },
        ),
      ).copyWith(secondary: AppColors.primary),
    );
  }
}

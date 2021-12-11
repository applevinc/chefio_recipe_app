import 'package:chefio_recipe_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      textTheme: TextTheme(
        headline6: GoogleFonts.inter(
          color: AppColors.mainText,
          fontSize: 22.0.sp,
          letterSpacing: 0.5.sp,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: GoogleFonts.inter(
          color: AppColors.secondaryText,
          fontSize: 17.0.sp,
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
    );
  }
}

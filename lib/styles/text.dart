import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  AppText._();

  static TextStyle get _defaultStyle {
    return GoogleFonts.poppins(
      fontSize: 14.sp,
      color: AppColors.mainText,
      //letterSpacing: 0.5.sp,
    );
  }

  static TextStyle bold300(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle bold400(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold500(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold600(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold700(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold800(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle bold900(BuildContext context) {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w900,
    );
  }
}

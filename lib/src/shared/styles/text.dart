import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  AppText._();

  static TextStyle bold400(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          color: AppColors.mainText,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5.sp,
        );
  }

  static TextStyle bold300(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          color: AppColors.mainText,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5.sp,
        );
  }

  static TextStyle bold500(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          color: AppColors.mainText,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5.sp,
        );
  }

  static TextStyle bold700(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          color: AppColors.mainText,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5.sp,
        );
  }

  static TextStyle bold900(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          color: AppColors.mainText,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5.sp,
        );
  }
}

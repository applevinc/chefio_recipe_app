import 'package:chefio_recipe_app/src/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Messenger {
  static show(
    BuildContext context, {
    required String message,
  }) {
    snackBar(
      context,
      child: CustomSnackBar.info(
        label: 'Info',
        message: message,
      ),
    );
  }

  static error(
    BuildContext context, {
    required String message,
  }) {
    snackBar(
      context,
      child: CustomSnackBar.error(
        label: 'Failed',
        message: message,
      ),
    );
  }

  static success(
    BuildContext context, {
    required String message,
  }) {
    snackBar(
      context,
      child: CustomSnackBar.success(
        label: 'Success',
        message: message,
      ),
    );
  }

  static snackBar(BuildContext context, {required Widget child}) {
    showTopSnackBar(
      context,
      child,
      padding: EdgeInsets.zero,
    );
  }
}

class CustomSnackBar extends StatelessWidget {
  final String label;
  final String message;
  final Color backgroundColor;

  const CustomSnackBar.success({
    Key? key,
    required this.label,
    required this.message,
    this.backgroundColor = Colors.green,
  }) : super(key: key);

  const CustomSnackBar.error({
    Key? key,
    required this.label,
    required this.message,
    this.backgroundColor = AppColors.secondary,
  }) : super(key: key);

  const CustomSnackBar.info({
    Key? key,
    required this.label,
    required this.message,
    this.backgroundColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppText.bold500(context).copyWith(
      color: Colors.white,
      fontSize: 15.sp,
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            message,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

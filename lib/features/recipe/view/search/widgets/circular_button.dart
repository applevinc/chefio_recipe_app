import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CirclularButton extends StatelessWidget {
  const CirclularButton({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.onPressed,
  });

  final String label;
  final Color bgColor;
  final Color textColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Text(
            label,
            style: AppText.bold700(context).copyWith(
              color: textColor,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}

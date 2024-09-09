import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.showBorder = false,
    this.labelColor = Colors.white,
    this.loadingIndicatorColor = Colors.white,
    this.isBusy = false,
    this.disabled = false,
  });

  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? labelColor;
  final Color? borderColor;
  final Color loadingIndicatorColor;
  final bool showBorder;
  final bool isBusy;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled
          ? null
          : isBusy
              ? () {}
              : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        side: showBorder == true
            ? BorderSide(
                color: borderColor ?? AppColors.outline,
              )
            : null,
      ),
      child: isBusy
          ? Transform.scale(
              scale: 0.7,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(loadingIndicatorColor),
              ),
            )
          : Text(
              label,
              style: AppText.bold700(context).copyWith(
                color: labelColor,
                fontSize: 15.sp,
              ),
            ),
    );
  }
}

class AppButtonWithIcon extends StatelessWidget {
  const AppButtonWithIcon({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffff5842),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.google,
          ),
          SizedBox(width: 5.w),
          Text(
            label,
            style: AppText.bold700(context).copyWith(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

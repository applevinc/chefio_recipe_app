import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderColor,
    this.bgColor,
    this.showBorder = false,
    this.labelColor = Colors.white,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  final Color? bgColor;
  final Color? labelColor;
  final Color? borderColor;
  final bool? showBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        side: showBorder == true
            ? const BorderSide(
                color: AppColors.outline,
              )
            : null,
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: labelColor,
          fontSize: 15.0.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.105.sp,
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xffff5842),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.google,
          ),
          SizedBox(width: 5.w),
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.105.sp,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}

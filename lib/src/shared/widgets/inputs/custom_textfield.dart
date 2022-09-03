import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.border = true,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? border;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.r),
      borderSide: const BorderSide(
        color: Color(0xffd0dbea),
      ),
    );

    return TextFormField(
      obscureText: obscureText,
      onTap: onTap,
      style: AppText.bold500(context).copyWith(
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: AppText.bold500(context).copyWith(
          fontSize: 15.sp,
          color: AppColors.secondaryText,
        ),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w, end: 10.w),
          child: SvgPicture.asset(prefixIcon),
        ),
        suffixIcon: suffixIcon,
        border: border,
        enabledBorder: border,
      ),
    );
  }
}

class TextFieldIcon extends StatelessWidget {
  const TextFieldIcon({
    Key? key,
    required this.icon,
    this.onTap,
    this.color,
    this.padding,
    this.size,
  }) : super(key: key);

  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.only(left: 11.w),
        child: Icon(
          icon,
          size: size ?? 20.sp,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

class PasswordIcon extends StatelessWidget {
  const PasswordIcon(
    this._showPassword, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final bool _showPassword;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          _showPassword ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
          size: 20.sp,
          color: const Color(0xff9FA5C0),
        ),
      ),
    );
  }
}

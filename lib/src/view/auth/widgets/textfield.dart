import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon = AppIcons.showPassword,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final String suffixIcon;
  final bool obscureText;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool obscureText = widget.obscureText;

  _toggleObscureText() {
    if (obscureText == true) {
      setState(() {
        obscureText = false;
      });
    } else if (obscureText == false) {
      setState(() {
        obscureText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w, end: 10.w),
          child: SvgPicture.asset(widget.prefixIcon),
        ),
        suffixIcon: widget.obscureText == true
            ? GestureDetector(
                onTap: _toggleObscureText,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 24.w),
                  child: SvgPicture.asset(widget.suffixIcon),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
      ),
    );
  }
}

import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon = AppIcons.showPassword,
    this.obscureText = false,
    this.border = true,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final String suffixIcon;
  final bool obscureText;
  final bool? border;
  final Function()? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
      onTap: widget.onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        filled: true,
        fillColor: AppColors.form,
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
          borderSide: BorderSide(
            //color: AppColors.outline,
            width: widget.border == true ? 1.0 : 0,
            style: widget.border == true ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
      ),
    );
  }
}

import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? lableText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextInputType? textInputType;
  final bool obscure;
  final bool? isPasswordTextField;
  final TextEditingController? controller;
  final int? inputLimit;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final int maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final bool filled;
  final Color? fillColor;
  final bool isMultipleLine;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.title,
    this.lableText,
    this.hintText,
    this.hintTextStyle,
    this.textInputType,
    this.obscure = false,
    this.isPasswordTextField,
    this.controller,
    this.inputLimit,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.autovalidateMode,
    this.errorText,
    this.filled = true,
    this.fillColor,
    this.isMultipleLine = false,
    this.border,
    this.contentPadding,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.r),
      borderSide: const BorderSide(
        color: AppColors.outline,
      ),
    );

    final field = TextFormField(
      autofocus: autofocus,
      autovalidateMode: AutovalidateMode.disabled,
      style: AppText.bold500(context),
      keyboardType: textInputType,
      obscureText: obscure,
      maxLength: inputLimit,
      textInputAction: textInputAction,
      onTap: onTap,
      maxLines: (obscure == true) ? 1 : maxLines,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 24.w,
            ),
        isDense: true,
        counterText: "",
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        errorText: errorText,
        errorStyle: AppText.bold400(context).copyWith(
          color: AppColors.secondary,
          fontSize: 10.sp,
        ),
        labelText: lableText,
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        hintStyle: AppText.bold500(context).copyWith(
          fontSize: 15.sp,
          color: AppColors.secondaryText,
        ),
        labelStyle: AppText.bold500(context).copyWith(
          fontSize: 15.sp,
          color: AppColors.secondaryText,
        ),
        errorBorder: border == null
            ? defaultBorder.copyWith(
                borderSide: const BorderSide(
                  color: AppColors.secondary,
                  width: 2,
                ),
              )
            : border!.copyWith(
                borderSide: const BorderSide(
                  color: AppColors.secondary,
                  width: 2,
                ),
              ),
        enabledBorder: border ?? defaultBorder,
        focusedBorder: border == null
            ? defaultBorder.copyWith(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              )
            : border!.copyWith(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
        disabledBorder: border ?? defaultBorder,
        border: border ?? defaultBorder,
        focusedErrorBorder: border ??
            defaultBorder.copyWith(
              borderSide: const BorderSide(
                color: AppColors.secondary,
                width: 2,
              ),
            ),
      ),
    );

    if (title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: AppText.bold700(context).copyWith(
              color: AppColors.headlineText,
            ),
          ),
          SizedBox(height: 8.h),
          field,
        ],
      );
    } else {
      return field;
    }
  }
}

class TextFieldIcon extends StatelessWidget {
  const TextFieldIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
    this.padding,
    this.size,
  });

  final String icon;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsetsDirectional.only(start: 24.w, end: 10.w),
        child: SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.h,
          color: color ?? AppColors.mainText,
        ),
      ),
    );
  }
}

class PasswordIcon extends StatelessWidget {
  const PasswordIcon(
    this._showPassword, {
    super.key,
    required this.onTap,
  });

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

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.mainText,
          ),
    );
  }
}

import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.title,
    this.showStrength = false,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.showPrefixIcon = true,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? title;
  final bool showStrength;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool showPrefixIcon;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  void _onToggleVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final field = CustomTextField(
      title: widget.title,
      obscure: _hidePassword,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      hintText: widget.hintText ?? 'Password',
      prefixIcon: widget.showPrefixIcon ? const TextFieldIcon(icon: AppIcons.lock) : null,
      suffixIcon: _PasswordIcon(
        _hidePassword,
        onTap: _onToggleVisibility,
      ),
      onChanged: widget.onChanged,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (PasswordValidator.isNotCorrectLength(value)) {
              return 'Password must be a minimum of 8 characters';
            }
            return null;
          },
    );

    return field;
  }
}

class _PasswordIcon extends StatelessWidget {
  const _PasswordIcon(
    this._showPassword, {
    required this.onTap,
  });

  final bool _showPassword;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsetsDirectional.only(end: 26.75.w),
      icon: Icon(
        _showPassword ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
        size: 25.sp,
        color: AppColors.outline,
      ),
    );
  }
}

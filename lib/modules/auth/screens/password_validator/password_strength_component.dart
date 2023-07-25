import 'package:chefio_recipe_app/shared/assets/icons.dart';
import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:chefio_recipe_app/shared/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordStrengthComponent extends StatelessWidget {
  const PasswordStrengthComponent({
    Key? key,
    required this.containsSixCharacters,
    required this.containsNumber,
  }) : super(key: key);

  final bool containsSixCharacters;
  final bool containsNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PasswordRuleItem(rule: 'Atleast 6 characters', validated: containsSixCharacters),
        SizedBox(height: 16.h),
        _PasswordRuleItem(rule: 'Contains a number', validated: containsNumber),
      ],
    );
  }
}

class _PasswordRuleItem extends StatelessWidget {
  const _PasswordRuleItem({
    Key? key,
    required this.rule,
    required this.validated,
  }) : super(key: key);

  final String rule;
  final bool validated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(validated ? AppIcons.check : AppIcons.unCheck),
        SizedBox(width: 8.w),
        Text(
          rule,
          style: AppText.bold500(context).copyWith(
            fontSize: 15.sp,
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}

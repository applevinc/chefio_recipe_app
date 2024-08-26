import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/modules/auth/view/password_strength/password_strength.controller.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PasswordStrengthComponent<T extends PasswordStrengthController>
    extends StatelessWidget {
  const PasswordStrengthComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<T>();

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Your Password must contain:',
            style: AppText.bold500(context).copyWith(
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        _PasswordRuleItem(
          rule: 'Atleast 6 characters',
          validated: controller.containsSixCharacters,
        ),
        SizedBox(height: 16.h),
        _PasswordRuleItem(
          rule: 'Contains a number',
          validated: controller.containsNumber,
        ),
      ],
    );
  }
}

class _PasswordRuleItem extends StatelessWidget {
  const _PasswordRuleItem({
    required this.rule,
    required this.validated,
  });

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
            color: validated ? AppColors.mainText : AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}

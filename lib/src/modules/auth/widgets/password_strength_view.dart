import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordStrengthView extends StatelessWidget {
  const PasswordStrengthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppText.bold500(context).copyWith(
      fontSize: 15.sp,
      color: AppColors.secondaryText,
    );
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.check),
            SizedBox(width: 8.w),
            Text(
              'Atleast 6 characters',
              style: textStyle,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            SvgPicture.asset(AppIcons.unCheck),
            SizedBox(width: 8.w),
            Text(
              'Contains a number',
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}

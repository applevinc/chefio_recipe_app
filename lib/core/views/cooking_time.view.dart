import 'package:chefio_recipe_app/core/controllers/cooking_time.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CookingTimeView<T extends CookingTimeController> extends StatelessWidget {
  const CookingTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<T>();
    final titleStyle = AppText.bold700(context).copyWith(
      fontSize: 15.sp,
      color: AppColors.primary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Cooking Duration ',
            style: AppText.bold700(context).copyWith(
              fontSize: 17.sp,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '(in minutes)',
                style: AppText.bold700(context).copyWith(
                  color: AppColors.secondaryText,
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '<10',
              style: titleStyle,
            ),
            Text(
              '30',
              style: titleStyle,
            ),
            Text(
              '60',
              style: titleStyle,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Slider(
          value: controller.cookingTimeInMinutes,
          min: minCookingTimeInMinutes,
          max: maxCookingTimeInMinutes,
          divisions: 2,
          onChanged: (value) => controller.setCookingTime(value),
        ),
      ],
    );
  }
}

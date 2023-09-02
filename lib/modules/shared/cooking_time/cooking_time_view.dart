import 'package:chefio_recipe_app/modules/shared/cooking_time/cooking_time_viewmodel.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CookingTimeView<T extends CookingTimeViewModel> extends StatelessWidget {
  const CookingTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<T>();
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
          value: viewModel.cookingTimeInMinutes,
          min: minCookingTimeInMinutes,
          max: maxCookingTimeInMinutes,
          divisions: 2,
          onChanged: (value) => viewModel.setCookingTime(value),
        ),
      ],
    );
  }
}
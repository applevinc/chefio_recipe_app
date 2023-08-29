import 'package:chefio_recipe_app/modules/home/screens/search/layouts/filter/search_filter_viewmodel.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/widgets/others/duration_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchFilterCookingDurationView extends StatelessWidget {
  const SearchFilterCookingDurationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppText.bold700(context).copyWith(
      fontSize: 15.sp,
    );
    final viewModel = context.watch<SearchFilterViewModel>();

    return Padding(
      padding: AppPadding.symetricHorizontalOnly,
      child: Column(
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
                style: titleStyle.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                '30',
                style: titleStyle.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                '60',
                style: titleStyle.copyWith(
                  color: AppColors.primary,
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          DurationSlider(
            value: viewModel.duration,
            onChanged: (value) => viewModel.setDuration(value),
          ),
        ],
      ),
    );
  }
}

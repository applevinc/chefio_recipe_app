import 'package:chefio_recipe_app/modules/home/screens/search/widgets/circular_button.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/widgets/others/duration_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.w, bottom: 37.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add a Filter',
            style: AppText.bold700(context).copyWith(
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 32.h),
          const _CategoriesView(),
          SizedBox(height: 33.h),
          const _CookingDurationView(),
          SizedBox(height: 52.h),
          Padding(
            padding: AppPadding.symetricHorizontalOnly,
            child: Row(
              children: [
                CirclularButton(
                  label: 'Cancel',
                  bgColor: AppColors.form,
                  textColor: AppColors.mainText,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 15.w),
                CirclularButton(
                  label: 'Done',
                  bgColor: AppColors.primary,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoriesView extends StatelessWidget {
  const _CategoriesView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: AppText.bold700(context).copyWith(
            fontSize: 17.sp,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _CookingDurationView extends StatelessWidget {
  const _CookingDurationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppText.bold700(context).copyWith(
      fontSize: 15.sp,
    );

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
          const DurationSlider(),
        ],
      ),
    );
  }
}

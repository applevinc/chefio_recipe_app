import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/components/circular_tab_button.dart';
import 'package:chefio_recipe_app/src/modules/search/components/circular_button.dart';
import 'package:chefio_recipe_app/src/modules/search/components/cooking_duration_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFilterView extends StatelessWidget {
  const AddFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add a Filter',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 32.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Category',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          SizedBox(height: 16.h),
         // const HorizontalListViewCircleTabButtons(),
          SizedBox(height: 32.h),
          const CookingDuration(),
          SizedBox(height: 52.h),
          const _Actions(),
        ],
      ),
    );
  }
}

class CookingDuration extends StatelessWidget {
  const CookingDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Cooking Duration ',
            style: Theme.of(context).textTheme.bodyText2,
            children: <TextSpan>[
              TextSpan(
                text: '(in minutes)',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColors.secondaryText),
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
            Text(
              '30',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
            Text(
              '60',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(height: 5.h),
        const CookingDurationSlider(),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w, bottom: 3.h),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return const _Item();
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.history, color: AppColors.secondaryText),
              SizedBox(width: 17.w),
              Text(
                'Pancakes',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.headlineText),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.north_west, color: AppColors.secondaryText),
        ],
      ),
    );
  }
}

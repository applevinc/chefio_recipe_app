import 'package:chefio_recipe_app/modules/home/screens/search/layouts/filter/components/search_filter_categories_view.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/layouts/filter/components/search_filter_cooking_duration_view.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/layouts/filter/search_filter_viewmodel.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/widgets/circular_button.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.w, bottom: 37.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Add a Filter',
              style: AppText.bold700(context).copyWith(
                fontSize: 17.sp,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          const SearchFilterCategoriesView(),
          SizedBox(height: 33.h),
          const SearchFilterCookingDurationView(),
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
                  onPressed: () {
                    final viewModel = context.read<SearchFilterViewModel>();
                    final searchFilterRequest = viewModel.createSearchFilterRequest();
                    Navigator.pop(context, searchFilterRequest);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

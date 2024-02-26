import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/common/views/cooking_time/cooking_time_view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/sheets/filter/components/search_filter_categories.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/sheets/filter/search_filter.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/widgets/circular_button.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({super.key, required this.categories});

  final List<RecipeCategory> categories;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchFilterViewModel(categories: categories),
      child: const _SearchFilterSheet(),
    );
  }
}

class _SearchFilterSheet extends StatelessWidget {
  const _SearchFilterSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.w),
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
          SizedBox(height: 30.h),
          const SearchFilterCategoriesComponent(),
          SizedBox(height: 30.h),
          Padding(
            padding: AppPadding.symetricHorizontalOnly,
            child: const CookingTimeView<SearchFilterViewModel>(),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: AppPadding.symetricHorizontalOnly,
            child: Row(
              children: [
                CirclularButton(
                  label: 'Cancel',
                  bgColor: AppColors.form,
                  textColor: AppColors.mainText,
                  onPressed: () {
                    context.pop();
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
                    context.pop(searchFilterRequest);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

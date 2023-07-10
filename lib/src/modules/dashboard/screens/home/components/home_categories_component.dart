import 'package:chefio_recipe_app/src/modules/dashboard/screens/home/home_viewmodel.dart';
import 'package:chefio_recipe_app/src/shared/styles/styles.dart';
import 'package:chefio_recipe_app/src/shared/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeCategoriesComponent extends StatelessWidget {
  const HomeCategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<HomeViewModel>();
    final selectedCategory = viewmodel.selectedCategory;
    final categories = viewmodel.categories;

    if (viewmodel.busy(HomeLoadingState.init)) {
      return const CategoriesShimmer();
    }

    if (viewmodel.hasError) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPadding.symetricHorizontalOnly,
            child: Text(
              'Category',
              style: AppText.bold700(context).copyWith(
                fontSize: 17.sp,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 48.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: AppPadding.symetricHorizontalOnly,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryItem(
                  label: category.name,
                  selected: category.id == selectedCategory.id,
                  onTap: () => viewmodel.selectCategory(category),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.form,
          borderRadius: BorderRadius.circular(32.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppText.bold700(context).copyWith(
            color: selected ? Colors.white : AppColors.secondaryText,
            fontSize: 15.sp,
            letterSpacing: 0.10,
          ),
        ),
      ),
    );
  }
}

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPadding.symetricHorizontalOnly,
              child: ShimmerContainer(
                height: 24.h,
                width: 100.w,
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 48.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                padding: AppPadding.symetricHorizontalOnly,
                itemBuilder: (context, index) => ShimmerContainer(
                  width: 86.w,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

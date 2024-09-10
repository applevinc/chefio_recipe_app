
import 'package:chefio_recipe_app/core/widgets/others/back_drop.dart';
import 'package:chefio_recipe_app/modules/home/home.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/core/widgets/others/category_item.dart';
import 'package:chefio_recipe_app/core/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeCategoriesComponent extends StatelessWidget {
  const HomeCategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final selectedCategory = controller.selectedCategory;
    final categories = controller.categories;

    if (controller.busy(HomeLoadingState.init)) {
      return const CategoriesShimmer();
    }

    if (controller.hasError) {
      return const SizedBox.shrink();
    }

    return DashBackDrop(
      child: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
                  return CategoryItemView(
                    label: category.name,
                    selected: category.id == selectedCategory?.id,
                    onTap: () => controller.selectCategory(category),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              height: 8.h,
              color: const Color(0xFFF4F5F7),
            ),
          ],
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

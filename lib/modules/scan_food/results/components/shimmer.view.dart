import 'package:chefio_recipe_app/core/widgets/others/custom_shimmer.dart';
import 'package:chefio_recipe_app/core/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/recipes_grid.shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanFoodResultsShimmerView extends StatelessWidget {
  const ScanFoodResultsShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            CustomShimmer(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Column(
                  children: [
                    ShimmerContainer(
                      width: 200.h,
                      height: 200.h,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    SizedBox(height: 32.h),
                    TextShimmer(width: 108.w),
                  ],
                ),
              ),
            ),
            const GreyDivider(),
            const RecipesGridShimmer(isExpanded: true),
          ],
        ),
      ),
    );
  }
}

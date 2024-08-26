import 'package:chefio_recipe_app/modules/recipe/view/grid/item/recipe_grid_item.shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipesGridShimmer extends StatelessWidget {
  const RecipesGridShimmer({super.key, required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final child = GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: 151.w / 264.h,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const RecipeGridItemShimmer();
      },
    );

    if (isExpanded) {
      return Expanded(child: child);
    } else {
      return child;
    }
  }
}


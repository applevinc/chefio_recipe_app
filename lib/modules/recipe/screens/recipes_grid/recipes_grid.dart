import 'package:chefio_recipe_app/modules/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/recipes_grid/recipe-grid-item/recipe_grid_item.dart';
import 'package:chefio_recipe_app/shared/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({
    Key? key,
    this.isBusy = false,
    required this.recipes,
    this.onRefresh,
    this.isExpanded = true,
    this.physics,
    this.canRefetch = true,
  }) : super(key: key);

  final bool isBusy;
  final List<Recipe> recipes;
  final bool canRefetch;
  final Future<void> Function()? onRefresh;
  final bool isExpanded;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    if (isBusy) {
      return RecipesGridShimmer(isExpanded: isExpanded);
    }

    final grid = GridView.builder(
      physics: physics ?? const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: 151.w / 264.h,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeGridItem(recipe);
      },
    );

    Widget child;

    if (canRefetch && onRefresh != null) {
      child = RefreshIndicator(
        onRefresh: onRefresh!,
        child: grid,
      );
    } else {
      child = grid;
    }

    if (isExpanded) {
      return Expanded(child: child);
    } else {
      return child;
    }
  }
}

class RecipesGridShimmer extends StatelessWidget {
  const RecipesGridShimmer({super.key, required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final child = CustomShimmer(
      child: GridView.builder(
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShimmerContainer(
                    height: 31.h,
                    width: 31.h,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                  SizedBox(width: 8.w),
                  TextShimmer(width: 78.w),
                ],
              ),
              SizedBox(height: 16.h),
              ShimmerContainer(
                height: 151.h,
                borderRadius: BorderRadius.circular(16.r),
              ),
              SizedBox(height: 16.h),
              TextShimmer(width: 74.w),
              SizedBox(height: 8.h),
              TextShimmer(width: 90.w),
            ],
          );
        },
      ),
    );

    if (isExpanded) {
      return Expanded(child: child);
    } else {
      return child;
    }
  }
}

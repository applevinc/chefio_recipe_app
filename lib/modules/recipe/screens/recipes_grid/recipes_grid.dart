import 'package:chefio_recipe_app/modules/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/recipes_grid/recipe-grid-item/recipe_grid_item.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/recipes_grid/recipe-grid-item/recipe_grid_item_viewmodel.dart';
import 'package:chefio_recipe_app/shared/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      primary: false,
      physics: physics ?? const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: 151.w / 264.h,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (_) => RecipeGridItemViewModel(recipes[index]),
        child: const RecipeGridItem(),
      ),
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
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 32.h,
          childAspectRatio: 151.w / 264.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => ShimmerContainer(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );

    if (isExpanded) {
      return Expanded(child: child);
    } else {
      return child;
    }
  }
}

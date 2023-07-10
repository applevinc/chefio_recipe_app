import 'package:chefio_recipe_app/src/modules/shared/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/src/modules/shared/recipe/views/recipe-grid-item/recipe_grid_item.dart';
import 'package:chefio_recipe_app/src/modules/shared/recipe/views/recipe-grid-item/recipe_grid_item_viewmodel.dart';
import 'package:chefio_recipe_app/src/shared/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({
    Key? key,
    this.isBusy = false,
    required this.recipes,
    required this.onRefresh,
  }) : super(key: key);

  final bool isBusy;
  final List<Recipe> recipes;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (isBusy) {
      return const RecipesGridShimmer();
    }

    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
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
          itemCount: recipes.length,
          itemBuilder: (context, index) => ChangeNotifierProvider(
            create: (_) => RecipeGridItemViewModel(recipes[index]),
            child: const RecipeGridItem(),
          ),
        ),
      ),
    );
  }
}

class RecipesGridShimmer extends StatelessWidget {
  const RecipesGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomShimmer(
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
      ),
    );
  }
}

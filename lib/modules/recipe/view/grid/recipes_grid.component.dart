import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/components/empty_recipes.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/item/recipe_grid_item.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/recipes_grid.shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipesGridComponent extends StatelessWidget {
  const RecipesGridComponent({
    super.key,
    this.isBusy = false,
    required this.recipes,
    this.onRefresh,
    this.isExpanded = true,
    this.physics,
    this.canRefetch = true,
  });

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

    if (recipes.isEmpty) {
      if (isExpanded) {
        return const Expanded(child: EmptyRecipesComponent());
      } else {
        return const EmptyRecipesComponent();
      }
    }

    final grid = GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: 145.w / 260.h,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeGridItemComponent(recipe);
      },
    );

    late Widget child;

    if (canRefetch && onRefresh != null) {
      child = RefreshIndicator.adaptive(
        onRefresh: onRefresh!,
        backgroundColor: Colors.white,
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

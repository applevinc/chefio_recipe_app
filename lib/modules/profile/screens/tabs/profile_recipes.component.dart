import 'package:chefio_recipe_app/modules/recipe/view/grid/components/empty_recipes.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/item/recipe_grid_item.component.dart';
import 'package:chefio_recipe_app/modules/profile/screens/tabs/profile_recipes.controller.dart';
import 'package:chefio_recipe_app/core/widgets/others/error_view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/recipes_grid.shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileRecipesTabComponent<T extends ProfileRecipesController>
    extends StatefulWidget {
  const ProfileRecipesTabComponent({super.key});

  @override
  State<ProfileRecipesTabComponent> createState() =>
      _ProfileRecipesTabComponentState<T>();
}

class _ProfileRecipesTabComponentState<T extends ProfileRecipesController>
    extends State<ProfileRecipesTabComponent> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    final controller = context.read<T>();

    if (controller.recipes.isEmpty) {
      await controller.getRecipes();
    }
  }

  Future<void> refresh() async {
    await context.read<T>().getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, controller, _) {
        if (controller.isBusy) {
          return const RecipesGridShimmer(isExpanded: false);
        }

        if (controller.hasError) {
          return ErrorView(
            error: controller.modelError,
            refetch: init,
          );
        }

        final recipes = controller.recipes;

        if (recipes.isEmpty) {
          return const EmptyRecipesComponent();
        }

        return RefreshIndicator.adaptive(
          onRefresh: refresh,
          child: GridView.builder(
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
          ),
        );
      },
    );
  }
}

import 'package:chefio_recipe_app/modules/recipe/view/recipes_grid/recipes_grid.component.dart';
import 'package:chefio_recipe_app/modules/profile/screens/tabs/profile_recipes.controller.dart';
import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileRecipesTabView<T extends ProfileRecipesController> extends StatefulWidget {
  const ProfileRecipesTabView({super.key});

  @override
  State<ProfileRecipesTabView> createState() => _ProfileRecipesTabViewState<T>();
}

class _ProfileRecipesTabViewState<T extends ProfileRecipesController>
    extends State<ProfileRecipesTabView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    await context.read<T>().getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, controller, _) {
        if (controller.hasError) {
          return ErrorView(error: controller.modelError, refetch: init);
        }

        return RecipesGridComponent(
          isExpanded: false,
          recipes: controller.recipes,
          isBusy: controller.isBusy,
          onRefresh: controller.getRecipes,
        );
      },
    );
  }
}

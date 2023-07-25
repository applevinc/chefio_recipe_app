import 'package:chefio_recipe_app/modules/profile/screens/tabs/profile_recipes_viewmodel.dart';
import 'package:chefio_recipe_app/modules/shared/recipe/views/recipes_grid.dart';
import 'package:chefio_recipe_app/shared/widgets/others/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileRecipesTabView<T extends ProfileRecipesViewModel> extends StatefulWidget {
  const ProfileRecipesTabView({super.key});

  @override
  State<ProfileRecipesTabView> createState() => _ProfileRecipesTabViewState<T>();
}

class _ProfileRecipesTabViewState<T extends ProfileRecipesViewModel>
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
      builder: (context, viewmodel, _) {
        if (viewmodel.hasError) {
          return ErrorView(error: viewmodel.modelError, refetch: init);
        }

        return RecipesGrid(
          isExpanded: false,
          recipes: viewmodel.recipes,
          isBusy: viewmodel.isBusy,
          onRefresh: viewmodel.getRecipes,
        );
      },
    );
  }
}

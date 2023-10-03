import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/common/services/recipe/i_recipe_service.dart';
import 'package:chefio_recipe_app/common/views/recipe/recipes_grid/recipes_grid.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/profile/screens/tabs/profile_recipes_viewmodel.dart';
import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileRecipesTabView<T extends ProfileRecipesViewModel> extends StatelessWidget {
  const ProfileRecipesTabView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserRecipesViewModel(
        user: user,
        recipeService: locator<IRecipeService>(),
      ),
      child: _ProfileRecipesTabView<T>(),
    );
  }
}

class _ProfileRecipesTabView<T extends ProfileRecipesViewModel> extends StatefulWidget {
  const _ProfileRecipesTabView({super.key});

  @override
  State<_ProfileRecipesTabView> createState() => _ProfileRecipesTabViewState<T>();
}

class _ProfileRecipesTabViewState<T extends ProfileRecipesViewModel>
    extends State<_ProfileRecipesTabView> {
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

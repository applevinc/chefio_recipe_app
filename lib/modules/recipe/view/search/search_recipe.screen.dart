import 'package:chefio_recipe_app/modules/recipe/view/recipes_grid/recipes_grid.component.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/recipe/view/recipes_grid/recipes_grid.shimmer.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/components/search_appbar.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/components/search_history.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/components/search_suggestions.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';
import 'package:chefio_recipe_app/common/widgets/others/custom_shimmer.dart';
import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchRecipeScreen extends StatefulWidget {
  const SearchRecipeScreen({super.key});

  static String route = '/search';

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    final controller = context.read<SearchRecipeController>();

    if (controller.hasLoadedData) {
      return;
    }

    await controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchAppBarComponent(),
            Consumer<SearchRecipeController>(
              builder: (context, controller, _) {
                if (controller.busy(SearchLoadingState.init) ||
                    controller.isBuildingFrame) {
                  return const SearchRecipeShimmer();
                }

                if (controller.busy(SearchLoadingState.search)) {
                  return const RecipesGridShimmer(isExpanded: true);
                }

                if (controller.hasErrorForKey(SearchErrorState.init)) {
                  return ErrorView(
                    error: controller.error(SearchErrorState.init),
                    refetch: init,
                  );
                }

                final recipes = controller.recipes;

                if (recipes.isEmpty) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchHistoryComponent(),
                      SearchSuggestionsComponent(),
                    ],
                  );
                }

                return RecipesGridComponent(
                  recipes: controller.recipes,
                  isBusy: controller.busy(SearchLoadingState.search),
                  canRefetch: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

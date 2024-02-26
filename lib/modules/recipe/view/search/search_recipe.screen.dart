import 'package:chefio_recipe_app/modules/recipe/view/recipes_grid/recipes_grid.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/components/search_appbar.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/components/search_history.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/components/search_suggestions.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';
import 'package:chefio_recipe_app/common/widgets/others/custom_shimmer.dart';
import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchRecipeScreen extends StatelessWidget {
  const SearchRecipeScreen({super.key});

  static String route = '/search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchRecipeController(
        searchService: locator<ISearchRecipeRepository>(),
        recipeRepository: locator<IRecipeRepository>(),
      ),
      child: const _SearchRecipeScreen(),
    );
  }
}

class _SearchRecipeScreen extends StatefulWidget {
  const _SearchRecipeScreen();

  @override
  State<_SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<_SearchRecipeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    await context.read<SearchRecipeController>().init();
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
                if (controller.busy(SearchLoadingState.init)) {
                  return const SearchShimmerView();
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

                return RecipesGrid(
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

class SearchShimmerView extends StatelessWidget {
  const SearchShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(height: 8.h),
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ShimmerContainer(height: 27.h),
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
          ),
          ShimmerContainer(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(height: 27.h, width: 147.w),
                SizedBox(height: 24.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 16.h,
                  children: List.generate(
                    8,
                    (index) => ShimmerContainer(
                      height: 48.h,
                      width: 118.w,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:chefio_recipe_app/common/services/category/i_category_service.dart';
import 'package:chefio_recipe_app/common/views/recipe/recipes_grid/recipes_grid.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/components/search_appbar_component.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/components/search_history_view.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/components/search_suggestions_view.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_viewmodel.dart';
import 'package:chefio_recipe_app/modules/home/services/i_search_service.dart';
import 'package:chefio_recipe_app/common/widgets/others/custom_shimmer.dart';
import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchViewModel(
        searchService: locator<ISearchService>(),
        categoryService: locator<ICategoryService>(),
      ),
      child: const _SearchScreen(),
    );
  }
}

class _SearchScreen extends StatefulWidget {
  const _SearchScreen();

  @override
  State<_SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<_SearchScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    await context.read<SearchViewModel>().init();
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
            Consumer<SearchViewModel>(
              builder: (context, viewmodel, _) {
                if (viewmodel.busy(SearchLoadingState.init)) {
                  return const SearchShimmerView();
                }

                if (viewmodel.busy(SearchLoadingState.search)) {
                  return const RecipesGridShimmer(isExpanded: true);
                }

                if (viewmodel.hasErrorForKey(SearchErrorState.init)) {
                  return ErrorView(
                    error: viewmodel.error(SearchErrorState.init),
                    refetch: init,
                  );
                }

                final recipes = viewmodel.recipes;

                if (recipes.isEmpty) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchHistoryView(),
                      SearchSuggestionView(),
                    ],
                  );
                }

                return RecipesGrid(
                  recipes: viewmodel.recipes,
                  isBusy: viewmodel.busy(SearchLoadingState.search),
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

import 'dart:io';

import 'package:chefio_recipe_app/modules/scan_food/results/components/scan_food_results_appbar.view.dart';
import 'package:chefio_recipe_app/modules/scan_food/results/components/shimmer.view.dart';
import 'package:chefio_recipe_app/modules/scan_food/results/scan_food_results_viewmodel.dart';
import 'package:chefio_recipe_app/common/views/recipe/recipes_grid/recipes_grid.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/common/services/recipe/i_recipe_service.dart';
import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:chefio_recipe_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanFoodResultsScreen extends StatelessWidget {
  const ScanFoodResultsScreen({super.key, this.image, required this.type});

  final File? image;
  final String type;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScanFoodResultsViewModel(
        type: type,
        image: image,
        recipeService: locator<IRecipeService>(),
      ),
      child: const _ScanFoodResultsScreen(),
    );
  }
}

class _ScanFoodResultsScreen extends StatefulWidget {
  const _ScanFoodResultsScreen({Key? key}) : super(key: key);

  @override
  State<_ScanFoodResultsScreen> createState() => _ScanFoodResultsScreenState();
}

class _ScanFoodResultsScreenState extends State<_ScanFoodResultsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    await context.read<ScanFoodResultsViewModel>().getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ScanFoodResultsViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isBusy) {
            return const ScanFoodResultsShimmerView();
          }

          if (viewModel.hasError) {
            return ErrorView(
              error: viewModel.modelError,
              refetch: init,
            );
          }

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const ScanFoodResultsAppBarView(),
              ];
            },
            body: Column(
              children: [
                const GreyDivider(),
                RecipesGrid(
                  recipes: viewModel.recipes,
                  isBusy: viewModel.anyObjectsBusy,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
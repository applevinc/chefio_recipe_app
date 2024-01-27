import 'dart:io';

import 'package:chefio_recipe_app/common/models/recipe.dart';
import 'package:chefio_recipe_app/common/services/recipe/i_recipe_service.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class ScanFoodResultsViewModel extends BaseController {
  final IRecipeService _recipeService;
  late File? image;
  late String type;

  ScanFoodResultsViewModel({
    required this.type,
    required this.image,
    required IRecipeService recipeService,
  }) : _recipeService = recipeService;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  Future<void> getRecipes() async {
    clearErrors();

    try {
      setBusy(true);
      _recipes = await _recipeService.getRecipesByScan();
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

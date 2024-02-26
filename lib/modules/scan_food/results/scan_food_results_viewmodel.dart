import 'dart:io';

import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class ScanFoodResultsViewModel extends BaseController {
  final IRecipeRepository _recipeRepository;
  late File? image;
  late String type;

  ScanFoodResultsViewModel({
    required this.type,
    required this.image,
    required IRecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  Future<void> getRecipes() async {
    clearErrors();

    try {
      setBusy(true);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

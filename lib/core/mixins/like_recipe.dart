import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';

mixin LikeRecipeMixin on ChangeNotifier {
  late IRecipeRepository _recipeRepository;

  void setRecipeRepository(IRecipeRepository recipeRepository) {
    _recipeRepository = recipeRepository;
  }

  Future<void> likeRecipe(Recipe recipe) async {
    recipe.isLiked = !recipe.isLiked;
    _updateLikeCount(recipe);
    notifyListeners();

    try {
      await _recipeRepository.updateLikeStatus(recipe.id, recipe.isLiked);
    } on Failure {
      recipe.isLiked = !recipe.isLiked;
      _updateLikeCount(recipe);
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  void _updateLikeCount(Recipe recipe) {
    if (recipe.isLiked) {
      recipe.likeCount++;
      return;
    }

    if (recipe.likeCount > 0) {
      recipe.likeCount--;
    }
  }
}

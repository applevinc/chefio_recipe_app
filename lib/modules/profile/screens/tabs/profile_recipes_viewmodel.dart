import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

abstract class ProfileRecipesViewModel extends BaseController {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  void updateRecipes(List<Recipe> values) {
    _recipes = values;
  }

  Future<void> getRecipes();
}

class UserLikedRecipesViewModel extends ProfileRecipesViewModel {
  final IRecipeRepository _recipeRepository;
  final User user;

  UserLikedRecipesViewModel(
      {required IRecipeRepository recipeRepository, required this.user})
      : _recipeRepository = recipeRepository;

  @override
  Future<void> getRecipes() async {
    clearErrors();
    try {
      setBusy(true);
      final List<Recipe> values =
          await _recipeRepository.getLikedRecipesByUser(userId: user.id);
      updateRecipes(values);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

class UserRecipesViewModel extends ProfileRecipesViewModel {
  final IRecipeRepository _recipeRepository;
  final User user;

  UserRecipesViewModel({required IRecipeRepository recipeRepository, required this.user})
      : _recipeRepository = recipeRepository;

  @override
  Future<void> getRecipes() async {
    clearErrors();
    try {
      setBusy(true);
      final List<Recipe> values =
          await _recipeRepository.getRecipesByUser(userId: user.id);
      updateRecipes(values);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

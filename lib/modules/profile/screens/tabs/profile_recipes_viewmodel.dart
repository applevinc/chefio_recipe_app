import 'package:chefio_recipe_app/modules/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/services/i_recipe_service.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/utils/base_viewmodel.dart';

abstract class ProfileRecipesViewModel extends BaseViewModel {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  void updateRecipes(List<Recipe> values) {
    _recipes = values;
  }

  Future<void> getRecipes();
}

class UserLikedRecipesViewModel extends ProfileRecipesViewModel {
  final IRecipeService _recipeService;
  final User user;

  UserLikedRecipesViewModel({required IRecipeService recipeService, required this.user})
      : _recipeService = recipeService;

  @override
  Future<void> getRecipes() async {
    clearErrors();
    try {
      setBusy(true);
      final List<Recipe> values =
          await _recipeService.getLikedRecipesByUser(userId: user.id);
      updateRecipes(values);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

class UserRecipesViewModel extends ProfileRecipesViewModel {
  final IRecipeService _recipeService;
  final User user;

  UserRecipesViewModel({required IRecipeService recipeService, required this.user})
      : _recipeService = recipeService;

  @override
  Future<void> getRecipes() async {
    clearErrors();
    try {
      setBusy(true);
      final List<Recipe> values = await _recipeService.getRecipesByUser(userId: user.id);
      updateRecipes(values);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

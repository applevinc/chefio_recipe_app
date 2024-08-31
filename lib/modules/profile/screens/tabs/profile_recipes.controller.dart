import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/models/user.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

abstract class ProfileRecipesController extends ViewController {
  ProfileRecipesController({
    required this.recipeRepository,
    required this.user,
  });

  final IRecipeRepository recipeRepository;

  final User user;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  Future<void> getRecipes();
}

class UserLikedRecipesController extends ProfileRecipesController {
  UserLikedRecipesController({
    required super.recipeRepository,
    required super.user,
  });

  @override
  Future<void> getRecipes() async {
    clearErrors();

    try {
      setBusy(true);
      _recipes = await recipeRepository.getLikedRecipesByUser(user);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

class UserRecipesController extends ProfileRecipesController {
  UserRecipesController({
    required super.recipeRepository,
    required super.user,
  });

  @override
  Future<void> getRecipes() async {
    clearErrors();

    try {
      setBusy(true);
      _recipes = await recipeRepository.getRecipesByUser(user);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

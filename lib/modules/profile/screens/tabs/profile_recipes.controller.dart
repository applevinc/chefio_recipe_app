import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_list_repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

abstract class ProfileRecipesController extends ViewController {
  ProfileRecipesController({
    required this.recipeListRepository,
    required this.user,
  });

  final IRecipeListRepository recipeListRepository;

  final User user;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  Future<void> getRecipes();
}

class UserLikedRecipesController extends ProfileRecipesController {
  UserLikedRecipesController({
    required super.recipeListRepository,
    required super.user,
  });

  @override
  Future<void> getRecipes() async {
    clearErrors();

    try {
      setBusy(true);
      _recipes = await recipeListRepository.getLikedRecipesByUser(user);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

class UserRecipesController extends ProfileRecipesController {
  UserRecipesController({
    required super.recipeListRepository,
    required super.user,
  });

  @override
  Future<void> getRecipes() async {
    clearErrors();

    try {
      setBusy(true);
      _recipes = await recipeListRepository.getRecipesByUser(user);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }
}

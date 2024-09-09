import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';

abstract class IRecipeListRepository {
  Future<List<Recipe>> getRecipes({required RecipeCategory? category});
  Future<List<Recipe>> getRecipesByUser(User user);
  Future<List<Recipe>> getLikedRecipesByUser(User user);
  Future<List<RecipeCategory>> getCategories();
}

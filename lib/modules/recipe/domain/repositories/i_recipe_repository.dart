import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';

abstract class IRecipeRepository {
  Future<List<Recipe>> getRecipes({required RecipeCategory category});
  Future<List<Recipe>> getRecipesByUser({required String userId});
  Future<List<Recipe>> getLikedRecipesByUser({required String userId});
  Future<List<Recipe>> search(String query);
  Future<List<RecipeCategory>> getAllCategories();
}

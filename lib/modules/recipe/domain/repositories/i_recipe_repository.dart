import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/upload_recipe.request.dart';

abstract class IRecipeRepository {
  Future<List<Recipe>> getRecipes({required RecipeCategory? category});
  Future<List<Recipe>> getRecipesByUser({required String userId});
  Future<List<Recipe>> getLikedRecipesByUser({required String userId});
  Future<List<Recipe>> search(String query);
  Future<List<RecipeCategory>> getCategories();
  Future<void> upload(UploadRecipeRequest request);
}

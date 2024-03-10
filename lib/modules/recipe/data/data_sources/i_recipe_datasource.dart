import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/requests/upload_recipe_request.model.dart';

abstract class IRecipeDataSource {
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category});
  Future<List<RecipeModel>> getRecipesByUser({required String userId});
  Future<List<RecipeModel>> getLikedRecipesByUser({required String userId});
  Future<List<RecipeModel>> search(String query);
  Future<List<RecipeCategoryModel>> getAllCategories();
  Future<void> upload(UploadRecipeRequestModel request);
}

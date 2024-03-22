import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/requests/upload_recipe_request.model.dart';

abstract class IRecipeDataSource {
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category});
  Future<List<RecipeModel>> getRecipesByUser(User user);
  Future<List<RecipeModel>> getLikedRecipesByUser(User user);
  Future<List<RecipeCategoryModel>> getAllCategories();
  Future<void> upload(UploadRecipeRequestModel request);
}

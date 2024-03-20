import 'package:chefio_recipe_app/features/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/requests/upload_recipe_request.model.dart';

class RecipeDataSource implements IRecipeDataSource {
  @override
  Future<List<RecipeCategoryModel>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> getLikedRecipesByUser({required String userId}) {
    // TODO: implement getLikedRecipesByUser
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category}) {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> getRecipesByUser({required String userId}) {
    // TODO: implement getRecipesByUser
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<void> upload(UploadRecipeRequestModel request) {
    // TODO: implement upload
    throw UnimplementedError();
  }
}

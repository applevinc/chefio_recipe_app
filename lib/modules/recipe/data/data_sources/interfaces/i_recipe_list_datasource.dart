import 'package:chefio_recipe_app/modules/auth/data/models/user.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';

abstract class IRecipeListDataSource {
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category});
  Future<List<RecipeModel>> getRecipesByUser(UserModel user);
  Future<List<RecipeModel>> getLikedRecipesByUser(UserModel user);
  Future<List<RecipeCategoryModel>> getAllCategories();
}

import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';

abstract class IRecipeListDataSource {
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category});
  Future<List<RecipeModel>> getRecipesByUser(User user);
  Future<List<RecipeModel>> getLikedRecipesByUser(User user);
  Future<List<RecipeCategoryModel>> getAllCategories();
}

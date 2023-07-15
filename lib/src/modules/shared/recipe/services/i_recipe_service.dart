import 'package:chefio_recipe_app/src/modules/shared/category/models/category.dart';
import 'package:chefio_recipe_app/src/modules/shared/recipe/models/recipe.dart';

abstract class IRecipeService {
  Future<List<Recipe>> getRecipes({required Category category});
  Future<List<Recipe>> getRecipesByUser({required String userId});
  Future<List<Recipe>> getLikedRecipesByUser({required String userId});
}

import 'package:chefio_recipe_app/src/modules/shared/category/models/category.dart';
import 'package:chefio_recipe_app/src/modules/shared/recipe/models/recipe.dart';

abstract class IRecipeService {
  Future<List<Recipe>> getRecipes({required Category category});
}
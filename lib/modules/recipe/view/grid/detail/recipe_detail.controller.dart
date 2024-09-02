import 'package:chefio_recipe_app/core/mixins/like_recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

class RecipeDetailController extends ViewController with LikeRecipeMixin {
  final Recipe recipe;

  RecipeDetailController(this.recipe, {required IRecipeRepository recipeRepository}) {
    setRecipeRepository(recipeRepository);
  }

  String get subtitle {
    final duration = '${recipe.minCookingTimeInMinutes} mins';
    final category = recipe.category?.name;

    if (category == null) {
      return duration;
    }

    return '$category · $duration';
  }
}

import 'package:chefio_recipe_app/core/mixins/like_recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

class RecipeDetailController extends ViewController with LikeRecipeMixin {
  RecipeDetailController(this.recipe, {required IRecipeRepository recipeRepository}) {
    setRecipeRepository(recipeRepository);
  }

  final Recipe recipe;

  String get subtitle {
    final duration = '${recipe.minCookingTimeInMinutes} mins';
    final category = recipe.category?.name;

    if (category == null) {
      return duration;
    }

    return '$category · $duration';
  }

  String get likeCount {
    final count = recipe.likeCount;

    if (count == 0) {
      return '';
    }

    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }

    return count.toString();
  }
}

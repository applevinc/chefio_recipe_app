import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

class RecipeDetailController extends ViewController {
  final Recipe recipe;

  RecipeDetailController(this.recipe);

  String get subtitle {
    final duration = '${recipe.minCookingTimeInMinutes} mins';
    final category = recipe.category?.name;

    if (category == null) {
      return duration;
    }

    return '$category · $duration';
  }
}

import 'package:chefio_recipe_app/core/mixins/like_recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/utils.dart';

class RecipeGridItemController extends ViewController with LikeRecipeMixin {
  RecipeGridItemController(this.recipe, {required IRecipeRepository recipeRepository}) {
    setRecipeRepository(recipeRepository);
  }

  final Recipe recipe;

  String? get category => recipe.category?.name.toTitleCase;

  String get subtitle {
    String text = '';

    if (recipe.category != null && recipe.category!.name != 'all') {
      final category = recipe.category!.name.toTitleCase;
      text = '$category • >${recipe.minCookingTimeInMinutes} mins';
    } else {
      text = '${recipe.minCookingTimeInMinutes} mins';
    }

    return text;
  }
}

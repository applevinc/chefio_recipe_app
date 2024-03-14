import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class RecipeDetailController extends BaseController {
  final Recipe recipe;

  RecipeDetailController(this.recipe);
}

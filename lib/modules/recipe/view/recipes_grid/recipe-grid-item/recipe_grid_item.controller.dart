import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class RecipeGridItemController extends BaseController {
  final Recipe recipe;

  RecipeGridItemController(this.recipe);
}

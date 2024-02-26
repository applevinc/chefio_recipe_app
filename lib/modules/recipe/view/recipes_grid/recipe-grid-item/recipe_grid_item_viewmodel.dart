import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class RecipeGridItemViewModel extends BaseController {
  final Recipe recipe;

  RecipeGridItemViewModel(this.recipe);
}

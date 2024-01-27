import 'package:chefio_recipe_app/common/models/recipe.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class RecipeDetailViewModel extends BaseController {
  final Recipe recipe;

  RecipeDetailViewModel(this.recipe);
}

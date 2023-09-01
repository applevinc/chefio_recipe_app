import 'package:chefio_recipe_app/modules/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

class RecipeGridItemViewModel extends BaseViewModel {
  final Recipe recipe;

  RecipeGridItemViewModel(this.recipe);
}

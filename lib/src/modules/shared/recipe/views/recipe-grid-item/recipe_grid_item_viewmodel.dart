import 'package:chefio_recipe_app/src/modules/shared/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class RecipeGridItemViewModel extends BaseViewModel {
  final Recipe recipe;

  RecipeGridItemViewModel(this.recipe);
}

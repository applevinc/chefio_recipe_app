import 'package:chefio_recipe_app/modules/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

class RecipesViewModel extends BaseViewModel {
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
}

import 'package:chefio_recipe_app/src/modules/shared/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class RecipesViewModel extends BaseViewModel {
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  
}

import 'package:chefio_recipe_app/common/models/recipe.dart';
import 'package:chefio_recipe_app/utils/base_viewmodel.dart';

class RecipesViewModel extends BaseViewModel {
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
}

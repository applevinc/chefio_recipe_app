import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

class RecipesController extends ViewController {
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;
}

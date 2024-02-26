import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class RecipesViewModel extends BaseController {
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
}

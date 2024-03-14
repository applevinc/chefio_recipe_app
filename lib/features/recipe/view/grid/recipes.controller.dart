import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class RecipesController extends BaseController {
  final List<Recipe> _recipes = [];
  
  List<Recipe> get recipes => _recipes;
}

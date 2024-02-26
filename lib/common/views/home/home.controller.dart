import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

enum HomeLoadingState { init, recipes }

class HomeController extends BaseController {
  HomeController({required IRecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  final IRecipeRepository _recipeRepository;

  final List<RecipeCategory> _categories = [
    RecipeCategory(id: 'all', name: 'All'),
  ];

  List<RecipeCategory> get categories => _categories;

  RecipeCategory _selectedCategory = RecipeCategory(id: 'all', name: 'All');

  RecipeCategory get selectedCategory => _selectedCategory;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  void selectCategory(RecipeCategory category) {
    _selectedCategory = category;
    getRecipesForCategory(category);
  }

  Future<void> init() async {
    try {
      setBusyForObject(HomeLoadingState.init, true);
      await Future.wait([
        _getCategories(),
        _initRecipes(),
      ]);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusyForObject(HomeLoadingState.init, false);
    }
  }

  Future<void> _getCategories() async {
    final List<RecipeCategory> results = await _recipeRepository.getAllCategories();

    for (var element in results) {
      _categories.add(element);
    }
  }

  Future<void> _initRecipes() async {
    getRecipesForCategory(selectedCategory);
  }

  void getRecipesForCategory(RecipeCategory category) async {
    try {
      setBusyForObject(HomeLoadingState.recipes, true);
      await _getRecipes(category);
    } on Failure catch (e) {
      setError(e);
    } finally {
      setBusyForObject(HomeLoadingState.recipes, false);
    }
  }

  Future<void> refreshRecipes() async {
    getRecipesForCategory(selectedCategory);
  }

  Future<void> _getRecipes(RecipeCategory category) async {
    clearErrors();
    _recipes = await _recipeRepository.getRecipes(category: category);
  }
}

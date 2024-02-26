import 'package:chefio_recipe_app/modules/recipe/domain/entities/category.dart';
import 'package:chefio_recipe_app/common/services/category/i_category_service.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/services/recipe/i_recipe_service.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

enum HomeLoadingState { init, recipes }

class HomeViewModel extends BaseController {
  final ICategoryService _categoryService;
  final IRecipeService _recipeService;

  HomeViewModel(
      {required ICategoryService categoryService, required IRecipeService recipeService})
      : _recipeService = recipeService,
        _categoryService = categoryService;

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
    notifyListeners();
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
    final List<RecipeCategory> results = await _categoryService.getAll();

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
    _recipes = await _recipeService.getRecipes(category: category);
  }
}

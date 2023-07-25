import 'package:chefio_recipe_app/modules/shared/category/models/category.dart';
import 'package:chefio_recipe_app/modules/shared/category/services/i_category_service.dart';
import 'package:chefio_recipe_app/modules/shared/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/modules/shared/recipe/services/i_recipe_service.dart';
import 'package:chefio_recipe_app/shared/models/failure.dart';
import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

enum HomeLoadingState { init, recipes }

class HomeViewModel extends BaseViewModel {
  final ICategoryService _categoryService;
  final IRecipeService _recipeService;

  HomeViewModel(
      {required ICategoryService categoryService, required IRecipeService recipeService})
      : _recipeService = recipeService,
        _categoryService = categoryService;

  final List<Category> _categories = [
    Category(id: 'all', name: 'All'),
  ];
  List<Category> get categories => _categories;

  Category _selectedCategory = Category(id: 'all', name: 'All');
  Category get selectedCategory => _selectedCategory;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  void selectCategory(Category category) {
    _selectedCategory = category;
    getRecipesForCategory(category);
    notifyListeners();
  }

  void init() async {
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
    final List<Category> results = await _categoryService.getAll();

    for (var element in results) {
      _categories.add(element);
    }
  }

  Future<void> _initRecipes() async {
    await _getRecipes(selectedCategory);
  }

  void getRecipesForCategory(Category category) async {
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

  Future<void> _getRecipes(Category category) async {
    clearErrors();
    _recipes = await _recipeService.getRecipes(category: category);
  }
}

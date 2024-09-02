import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/search_filter.request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_list_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';
import 'package:flutter/material.dart';

enum SearchLoadingState { init, search }

enum SearchErrorState { init, search }

class SearchRecipeController extends ViewController {
  SearchRecipeController({
    required ISearchRecipeRepository searchService,
    required IRecipeListRepository recipeListRepository,
  }) {
    _searchRecipeRepository = searchService;
    _recipeRepository = recipeListRepository;
    queryController = TextEditingController();
  }

  late final ISearchRecipeRepository _searchRecipeRepository;

  late final IRecipeListRepository _recipeRepository;

  late final TextEditingController queryController;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  List<String> _searchHistory = [];

  List<String> get searchHistories => _searchHistory;

  List<String> _searchSuggestion = [];

  List<String> get searchSuggestions => _searchSuggestion;

  List<RecipeCategory> _categories = [];

  List<RecipeCategory> get categories => _categories;

  bool get hasLoadedSearchData {
    return _searchHistory.isNotEmpty && _searchSuggestion.isNotEmpty && _categories.isNotEmpty;
  }

  void onHasLoadedSearchData() {
    _recipes.clear();
    queryController.clear();
    notifyListeners();
  }

  Future<void> init() async {
    clearErrors();

    try {
      setBusyForObject(SearchLoadingState.init, true);
      await Future.wait([
        _getSearchHistory(),
        _getSearchSuggestion(),
        _getCategories(),
      ]);
    } on Failure catch (e) {
      setErrorForObject(SearchErrorState.init, e);
    } finally {
      stopBuildingFrame();
      setBusyForObject(SearchLoadingState.init, false);
    }
  }

  Future<void> _getSearchHistory() async {
    _searchHistory = await _searchRecipeRepository.getSearchHistory();
  }

  Future<void> _getSearchSuggestion() async {
    _searchSuggestion = await _searchRecipeRepository.getSearchSuggestion();
  }

  Future<void> _getCategories() async {
    _categories = await _recipeRepository.getCategories();
  }

  Future<void> search(String query) async {
    clearErrors();

    try {
      setBusyForObject(SearchLoadingState.search, true);
      _recipes = await _searchRecipeRepository.search(query);
    } on Failure catch (e) {
      setErrorForObject(SearchErrorState.search, e);
    } finally {
      setBusyForObject(SearchLoadingState.search, false);
    }
  }

  Future<void> searchByFilter(SearchFilterRequest request) async {
    clearErrors();
    queryController.clear();

    try {
      setBusyForObject(SearchLoadingState.search, true);
      _recipes = await _searchRecipeRepository.searchByFilter(request);
    } on Failure catch (e) {
      setErrorForObject(SearchErrorState.search, e);
    } finally {
      setBusyForObject(SearchLoadingState.search, false);
    }
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }
}

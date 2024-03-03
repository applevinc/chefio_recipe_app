import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_history.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

enum SearchLoadingState { init, search }

enum SearchErrorState { init, search }

class SearchRecipeController extends BaseController {
  SearchRecipeController({
    required ISearchRecipeRepository searchService,
    required IRecipeRepository recipeRepository,
  })  : _recipeRepository = recipeRepository,
        _searchService = searchService;

  final ISearchRecipeRepository _searchService;

  final IRecipeRepository _recipeRepository;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  List<SearchHistory> _searchHistory = [];

  List<SearchHistory> get searchHistories => _searchHistory;

  List<SearchSuggestion> _searchSuggestion = [];

  List<SearchSuggestion> get searchSuggestions => _searchSuggestion;

  List<RecipeCategory> _categories = [];

  List<RecipeCategory> get categories => _categories;

  bool get hasLoadedData {
    return _searchHistory.isNotEmpty &&
        _searchSuggestion.isNotEmpty &&
        _categories.isNotEmpty;
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
    _searchHistory = await _searchService.getSearchHistory();
  }

  Future<void> _getSearchSuggestion() async {
    _searchSuggestion = await _searchService.getSearchSuggestion();
  }

  Future<void> _getCategories() async {
    _categories = await _recipeRepository.getCategories();
  }

  Future<void> search(String query) async {
    clearErrors();

    try {
      setBusyForObject(SearchLoadingState.search, true);
      _recipes = await _searchService.search(query);
    } on Failure catch (e) {
      setErrorForObject(SearchErrorState.search, e);
    } finally {
      setBusyForObject(SearchLoadingState.search, false);
    }
  }

  Future<void> searchByFilter(SearchFilterRequest request) async {
    clearErrors();

    try {
      setBusyForObject(SearchLoadingState.search, true);
      _recipes = await _searchService.searchByFilter(request);
    } on Failure catch (e) {
      setErrorForObject(SearchErrorState.search, e);
    } finally {
      setBusyForObject(SearchLoadingState.search, false);
    }
  }
}

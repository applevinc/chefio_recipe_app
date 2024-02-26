import 'package:chefio_recipe_app/modules/home/models/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/home/models/search_history.dart';
import 'package:chefio_recipe_app/modules/home/models/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/home/services/i_search_service.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

enum SearchLoadingState { init, search }

enum SearchErrorState { init, search }

class SearchViewModel extends BaseController {
  final ISearchService _searchService;
  final IRecipeRepository _recipeRepository;

  SearchViewModel({
    required ISearchService searchService,
    required IRecipeRepository recipeRepository,
  })  : _recipeRepository = recipeRepository,
        _searchService = searchService;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  List<SearchHistory> _searchHistory = [];
  List<SearchHistory> get searchHistories => _searchHistory;

  List<SearchSuggestion> _searchSuggestion = [];
  List<SearchSuggestion> get searchSuggestions => _searchSuggestion;

  final List<RecipeCategory> _categories = [
    RecipeCategory(id: 'all', name: 'All'),
  ];
  List<RecipeCategory> get categories => _categories;

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
    final List<RecipeCategory> results = await _recipeRepository.getAllCategories();

    for (var element in results) {
      _categories.add(element);
    }
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

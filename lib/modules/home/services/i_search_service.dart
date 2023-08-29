import 'package:chefio_recipe_app/modules/home/models/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/home/models/search_history.dart';
import 'package:chefio_recipe_app/modules/home/models/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/shared/recipe/models/recipe.dart';

abstract class ISearchService {
  Future<List<Recipe>> search(String query);
  Future<List<Recipe>> searchByFilter(SearchFilterRequest request);
  Future<List<SearchHistory>> getSearchHistory();
  Future<List<SearchSuggestion>> getSearchSuggestion();
}

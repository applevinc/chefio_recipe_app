import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_filter_request.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_history.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_suggestion.model.dart';

abstract class ISearchRecipeDataSource {
  Future<List<RecipeModel>> search(String query);
  Future<List<RecipeModel>> searchByFilter(SearchFilterRequestModel request);
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<List<SearchSuggestionModel>> getSearchSuggestion();
}

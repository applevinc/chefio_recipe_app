import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_history.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';

abstract class ISearchRecipeRepository {
  Future<List<Recipe>> search(String query);
  Future<List<Recipe>> searchByFilter(SearchFilterRequest request);
  Future<List<SearchHistory>> getSearchHistory();
  Future<List<SearchSuggestion>> getSearchSuggestion();
}

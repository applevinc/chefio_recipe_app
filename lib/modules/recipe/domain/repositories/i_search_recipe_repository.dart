import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/search_filter.request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';

abstract class ISearchRecipeRepository {
  Future<List<Recipe>> search(String query);
  Future<List<Recipe>> searchByFilter(SearchFilterRequest request);
  Future<List<String>> getSearchHistory();
  Future<List<String>> getSearchSuggestion();
}

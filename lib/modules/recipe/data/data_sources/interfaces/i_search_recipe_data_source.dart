import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_filter_request.model.dart';

abstract class ISearchRecipeDataSource {
  Future<List<RecipeModel>> search(String query);
  Future<List<RecipeModel>> searchByFilter(SearchFilterRequestModel request);
  Future<List<String>> getSearchHistory();
  Future<List<String>> getSearchSuggestion();
}

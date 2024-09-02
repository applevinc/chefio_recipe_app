import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_filter_request.model.dart';

class SearchRecipeDataSource implements ISearchRecipeDataSource {
  @override
  Future<List<String>> getSearchHistory() {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getSearchSuggestion() {
    // TODO: implement getSearchSuggestion
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> searchByFilter(SearchFilterRequestModel request) {
    // TODO: implement searchByFilter
    throw UnimplementedError();
  }
}

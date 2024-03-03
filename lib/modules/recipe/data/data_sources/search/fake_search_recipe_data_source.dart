import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/fake_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/search/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_filter_request.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_history.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_suggestion.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeSearchRecipeDataSource implements ISearchRecipeDataSource {
  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    await fakeNetworkDelay();
    return [
      SearchHistoryModel(text: 'Pancakes'),
      SearchHistoryModel(text: 'Salad'),
    ];
  }

  @override
  Future<List<SearchSuggestionModel>> getSearchSuggestion() async {
    await fakeNetworkDelay();
    return [
      SearchSuggestionModel(text: 'sushi'),
      SearchSuggestionModel(text: 'sandwich'),
      SearchSuggestionModel(text: 'seafood'),
      SearchSuggestionModel(text: 'fried rice'),
    ];
  }

  @override
  Future<List<RecipeModel>> search(String query) async {
    await fakeNetworkDelay();
    return getFakeRecipesData();
  }

  @override
  Future<List<RecipeModel>> searchByFilter(SearchFilterRequestModel request) async {
    await fakeNetworkDelay();
    return getFakeRecipesData();
  }
}

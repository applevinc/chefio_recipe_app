import 'package:chefio_recipe_app/modules/recipe/data/data_sources/fakes/fake_recipe_list_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_filter_request.model.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeSearchRecipeDataSource implements ISearchRecipeDataSource {
  @override
  Future<List<String>> getSearchHistory() async {
    await fakeNetworkDelay();
    return [
      'Pancakes',
      'Salad',
    ];
  }

  @override
  Future<List<String>> getSearchSuggestion() async {
    await fakeNetworkDelay();
    return [
      'sushi',
      'sandwich',
      'seafood',
      'fried rice',
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

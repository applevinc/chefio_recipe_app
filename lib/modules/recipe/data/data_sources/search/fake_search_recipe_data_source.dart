import 'package:chefio_recipe_app/common/models/user.dart';
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
    return _getRecipes();
  }

  @override
  Future<List<RecipeModel>> searchByFilter(SearchFilterRequestModel request) async {
    await fakeNetworkDelay();
    return _getRecipes();
  }

  List<RecipeModel> _getRecipes() {
    final List<CookingStep> steps = List.generate(
      2,
      (index) => CookingStep(
        step: index + 1,
        description: faker.lorem.sentence(),
        photoUrl: getOneMealPhoto(),
      ),
    );

    final List<RecipeModel> items = List.generate(
      random.nextInt(200) + 25,
      (index) => RecipeModel(
        id: getGuid(),
        user: User(
          id: getGuid(),
          photoUrl: getOneProfilePhoto(),
          firstName: faker.person.firstName(),
          lastName: faker.person.firstName(),
          recipeCount: random.nextInt(50),
          followingCount: random.nextInt(2000),
          followersCount: random.nextInt(2000),
        ),
        coverPhotoUrl: getOneMealPhoto(),
        description: faker.lorem.sentence(),
        minCookingTimeInMinutes: random.nextInt(100) + 50,
        ingredients: faker.lorem.words(5),
        likeCount: random.nextInt(500) + 13,
        steps: steps,
        title: faker.lorem.word(),
      ),
    );

    return items;
  }
}

import 'package:chefio_recipe_app/modules/home/models/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/home/models/search_history.dart';
import 'package:chefio_recipe_app/modules/home/models/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/home/services/i_search_service.dart';
import 'package:chefio_recipe_app/common/models/recipe.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:chefio_recipe_app/utils/utils.dart';

class FakeSearchService implements ISearchService {
  @override
  Future<List<Recipe>> search(String query) async {
    await fakeNetworkDelay();
    final List<CookingStep> steps = List.generate(
      2,
      (index) => CookingStep(
        step: index + 1,
        description: faker.lorem.sentence(),
        photoUrl: getOneMealPhoto(),
      ),
    );

    final List<Recipe> items = List.generate(
      random.nextInt(200) + 25,
      (index) => Recipe(
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

  @override
  Future<List<SearchHistory>> getSearchHistory() async {
    await fakeNetworkDelay();
    return List.generate(
      random.nextInt(3) + 1,
      (index) => SearchHistory(text: faker.lorem.word()),
    );
  }

  @override
  Future<List<SearchSuggestion>> getSearchSuggestion() async {
    await fakeNetworkDelay();
    return List.generate(
      random.nextInt(3) + 1,
      (index) => SearchSuggestion(text: faker.lorem.word()),
    );
  }

  @override
  Future<List<Recipe>> searchByFilter(SearchFilterRequest request) async {
    await fakeNetworkDelay();
    final List<CookingStep> steps = List.generate(
      2,
      (index) => CookingStep(
        step: index + 1,
        description: faker.lorem.sentence(),
        photoUrl: getOneMealPhoto(),
      ),
    );

    final List<Recipe> items = List.generate(
      random.nextInt(200) + 25,
      (index) => Recipe(
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

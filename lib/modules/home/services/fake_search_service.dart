import 'package:chefio_recipe_app/modules/home/services/i_search_service.dart';
import 'package:chefio_recipe_app/modules/shared/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/shared/models/user.dart';
import 'package:chefio_recipe_app/shared/utils/constants.dart';
import 'package:chefio_recipe_app/shared/utils/utils.dart';

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
        id: Utils.getGuid(),
        user: User(
          id: Utils.getGuid(),
          photoUrl: getOneProfilePhoto(),
          firstName: faker.person.firstName(),
          lastName: faker.person.firstName(),
          recipeCount: random.nextInt(50),
          followingCount: random.nextInt(2000),
          followersCount: random.nextInt(2000),
        ),
        coverPhotoUrl: getOneMealPhoto(),
        description: faker.lorem.sentence(),
        duration: random.nextInt(100) + 50,
        ingredients: faker.lorem.words(5),
        likeCount: random.nextInt(500) + 13,
        steps: steps,
        title: faker.lorem.word(),
      ),
    );
    return items;
  }
}

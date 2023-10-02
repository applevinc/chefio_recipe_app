import 'package:chefio_recipe_app/common/models/category.dart';
import 'package:chefio_recipe_app/common/models/recipe.dart';
import 'package:chefio_recipe_app/common/services/recipe/i_recipe_service.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/utils/utils.dart';

class FakeRecipeService implements IRecipeService {
  @override
  Future<List<Recipe>> getRecipes({required Category category}) async {
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
      random.nextInt(10) + 25,
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
  Future<List<Recipe>> getLikedRecipesByUser({required String userId}) async {
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
  Future<List<Recipe>> getRecipesByUser({required String userId}) async {
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
  Future<List<Recipe>> getRecipesByScan() async {
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

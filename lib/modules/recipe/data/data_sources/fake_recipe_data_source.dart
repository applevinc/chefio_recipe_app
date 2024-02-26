import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeRecipeDataSource implements IRecipeDataSource {
  @override
  Future<List<RecipeCategoryModel>> getAllCategories() async {
    await fakeNetworkDelay();
    return [
      RecipeCategoryModel(
        id: getGuid(),
        name: 'Food',
      ),
      RecipeCategoryModel(
        id: getGuid(),
        name: 'Drink',
      ),
    ];
  }

  @override
  Future<List<RecipeModel>> getLikedRecipesByUser({required String userId}) async {
    await fakeNetworkDelay();
    return _getRecipes();
  }

  @override
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel category}) async {
    await fakeNetworkDelay();
    return _getRecipes();
  }

  @override
  Future<List<RecipeModel>> getRecipesByUser({required String userId}) async {
    await fakeNetworkDelay();
    return _getRecipes();
  }

  @override
  Future<List<RecipeModel>> search(String query) async {
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

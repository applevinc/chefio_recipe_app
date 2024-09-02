import 'package:chefio_recipe_app/core/models/user.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/cooking_step.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeRecipeListDataSource extends IRecipeListDataSource {
  @override
  Future<List<RecipeCategoryModel>> getAllCategories() async {
    await fakeNetworkDelay();
    return [
      RecipeCategoryModel(
        id: getGuid(),
        name: 'All',
      ),
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
  Future<List<RecipeModel>> getLikedRecipesByUser(User user) async {
    await fakeNetworkDelay();
    return getFakeRecipesData();
  }

  @override
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category}) async {
    await fakeNetworkDelay();
    return getFakeRecipesData(category: category);
  }

  @override
  Future<List<RecipeModel>> getRecipesByUser(User user) async {
    await fakeNetworkDelay();
    return getFakeRecipesData();
  }
}

RecipeCategoryModel _getOneCategory() {
  final categories = [
    RecipeCategoryModel(
      id: getGuid(),
      name: 'All',
    ),
    RecipeCategoryModel(
      id: getGuid(),
      name: 'Food',
    ),
    RecipeCategoryModel(
      id: getGuid(),
      name: 'Drink',
    ),
  ];

  return categories[random.nextInt(categories.length)];
}

List<RecipeModel> getFakeRecipesData({RecipeCategoryModel? category}) {
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
        email: faker.internet.email(),
        recipeCount: random.nextInt(50),
        followingCount: random.nextInt(2000),
        followersCount: random.nextInt(2000),
      ),
      coverPhotoUrl: getOneMealPhoto(),
      description: faker.lorem.sentence(),
      minCookingTimeInMinutes: random.nextInt(100) + 50,
      ingredients: faker.lorem.words(5),
      likeCount: random.nextInt(500) + 13,
      cookingSteps: steps,
      title: faker.lorem.word(),
      category: category ?? _getOneCategory(),
    ),
  );

  return items;
}

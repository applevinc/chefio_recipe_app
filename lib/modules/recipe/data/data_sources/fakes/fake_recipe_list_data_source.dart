import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
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
  List<String> recipeTitles = [
    'Creamy Garlic Parmesan Pasta',
    'Spicy Honey Glazed Chicken',
    'Mediterranean Quinoa Salad',
    'Classic Beef Stroganoff',
    'Lemon Herb Grilled Salmon',
    'Vegetarian Stuffed Peppers',
    'Chocolate Lava Cake',
    'Smoky BBQ Pulled Pork',
    'Creamy Tomato Basil Soup',
    'Crispy Baked Zucchini Fries',
    'Buttermilk Pancakes with Maple Syrup',
    'Teriyaki Glazed Tofu Stir-Fry',
    'Avocado Toast with Poached Eggs',
    'Mango Salsa Grilled Shrimp',
    'Roasted Garlic Mashed Potatoes',
    'Tuscan Chicken Alfredo',
    'Thai Green Curry',
    'Balsamic Glazed Brussels Sprouts',
    'Spaghetti Carbonara',
    'Blueberry Cheesecake Bars'
  ];

  List<List<String>> ingredientsList = [
    ['Pasta', 'Garlic', 'Parmesan', 'Cream', 'Butter', 'Salt', 'Pepper'],
    ['Chicken thighs', 'Honey', 'Soy sauce', 'Garlic', 'Red pepper flakes', 'Olive oil'],
    ['Quinoa', 'Cucumber', 'Tomatoes', 'Feta cheese', 'Olives', 'Red onion', 'Lemon', 'Olive oil'],
    ['Beef', 'Onion', 'Mushrooms', 'Sour cream', 'Butter', 'Flour', 'Beef broth'],
    ['Salmon fillets', 'Lemon', 'Garlic', 'Herbs', 'Olive oil', 'Salt', 'Pepper'],
    ['Bell peppers', 'Quinoa', 'Black beans', 'Corn', 'Cheese', 'Tomato sauce', 'Onion'],
    ['Dark chocolate', 'Butter', 'Sugar', 'Eggs', 'Flour', 'Vanilla extract'],
    [
      'Pork shoulder',
      'BBQ sauce',
      'Brown sugar',
      'Garlic powder',
      'Onion powder',
      'Smoked paprika'
    ],
    ['Tomatoes', 'Basil', 'Garlic', 'Onion', 'Cream', 'Chicken broth', 'Olive oil'],
    ['Zucchini', 'Breadcrumbs', 'Parmesan', 'Eggs', 'Salt', 'Pepper', 'Olive oil'],
    ['Flour', 'Buttermilk', 'Eggs', 'Baking powder', 'Sugar', 'Butter', 'Maple syrup'],
    ['Tofu', 'Soy sauce', 'Ginger', 'Garlic', 'Vegetables', 'Rice', 'Sesame oil'],
    ['Avocado', 'Bread', 'Eggs', 'Salt', 'Pepper', 'Lemon juice'],
    ['Shrimp', 'Mango', 'Red onion', 'Cilantro', 'Lime', 'Olive oil'],
    ['Potatoes', 'Garlic', 'Butter', 'Cream', 'Salt', 'Pepper'],
    ['Chicken breasts', 'Heavy cream', 'Parmesan', 'Garlic', 'Butter', 'Pasta', 'Spinach'],
    ['Coconut milk', 'Green curry paste', 'Chicken', 'Vegetables', 'Fish sauce', 'Lime', 'Basil'],
    ['Brussels sprouts', 'Balsamic vinegar', 'Honey', 'Olive oil', 'Salt', 'Pepper'],
    ['Spaghetti', 'Eggs', 'Parmesan', 'Pancetta', 'Garlic', 'Salt', 'Pepper'],
    ['Cream cheese', 'Blueberries', 'Sugar', 'Graham crackers', 'Butter', 'Vanilla extract']
  ];

  List<String> descriptions = [
    'A rich and creamy pasta dish made with garlic, Parmesan cheese, and butter. Perfect for a quick and satisfying meal.',
    'Juicy chicken thighs glazed with a sweet and spicy honey sauce. A delicious balance of flavors with a kick of heat.',
    'A light and refreshing salad with quinoa, fresh vegetables, feta cheese, and a lemony olive oil dressing. Great as a side or a healthy main dish.',
    'Tender beef slices cooked in a creamy mushroom sauce, served over noodles. A comforting classic that never disappoints.',
    'Flaky salmon fillets grilled with a zesty lemon herb marinade. A simple yet elegant dish that’s full of flavor.',
    'Bell peppers stuffed with a hearty mixture of quinoa, black beans, and cheese, baked to perfection. A colorful and nutritious vegetarian option.',
    'A decadent dessert with a molten chocolate center that oozes out when you cut into it. Perfect for special occasions or when you need a chocolate fix.',
    'Slow-cooked pork shoulder shredded and mixed with smoky BBQ sauce. Serve on a bun with coleslaw for a classic BBQ experience.',
    'A warm and comforting soup made with fresh tomatoes, basil, and a touch of cream. Perfect for a cozy night in.',
    'Crispy on the outside, tender on the inside zucchini fries baked to golden perfection. A healthier alternative to traditional fries.',
    'Fluffy buttermilk pancakes served with butter and maple syrup. A breakfast favorite that’s easy to make and always a hit.',
    'A vibrant stir-fry with tofu, fresh vegetables, and a savory teriyaki glaze. A quick and healthy weeknight dinner option.',
    'Creamy avocado spread on toasted bread, topped with a perfectly poached egg. A simple yet satisfying breakfast or snack.',
    'Grilled shrimp topped with a fresh mango salsa, combining sweet and savory flavors for a light and delicious dish.',
    'Creamy and buttery mashed potatoes with a hint of roasted garlic. A perfect side dish for any meal.',
    'Tender chicken in a creamy Alfredo sauce with garlic, Parmesan, and spinach, served over pasta. A comforting and indulgent dinner.',
    'A fragrant and flavorful curry made with coconut milk, green curry paste, and your choice of protein and vegetables. A taste of Thailand at home.',
    'Roasted Brussels sprouts glazed with a sweet and tangy balsamic reduction. A tasty and healthy side dish that’s sure to please.',
    'A classic Italian pasta dish with a rich and creamy egg sauce, crispy pancetta, and a generous amount of Parmesan cheese.',
    'Creamy cheesecake bars with a graham cracker crust and a blueberry topping. A delightful and easy-to-make dessert for any occasion.'
  ];

  final List<CookingStep> steps = List.generate(
    2,
    (index) => CookingStep(
      step: index + 1,
      description: faker.lorem.sentence(),
      photoUrl: getOneMealPhoto(),
    ),
  );

  final List<RecipeModel> items = List.generate(
    recipeTitles.length,
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
        isFollowing: random.nextBool(),
      ),
      coverPhotoUrl: getOneMealPhoto(),
      description: descriptions[index],
      minCookingTimeInMinutes: random.nextInt(100) + 50,
      ingredients: ingredientsList[index],
      likeCount: random.nextInt(500) + 13,
      cookingSteps: steps,
      title: recipeTitles[index],
      category: category ?? _getOneCategory(),
      isLiked: random.nextBool(),
    ),
  );

  items.shuffle();

  return items;
}

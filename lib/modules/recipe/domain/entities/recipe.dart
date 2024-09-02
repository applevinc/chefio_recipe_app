import 'package:chefio_recipe_app/core/models/user.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/cooking_step.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';

class Recipe {
  final String id;
  final User user;
  final String title;
  final String description;
  final int minCookingTimeInMinutes;
  final String coverPhotoUrl;
  final int likeCount;
  final List<String> ingredients;
  final List<CookingStep> cookingSteps;
  final RecipeCategory? category;
  bool isLiked;

  Recipe({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.minCookingTimeInMinutes,
    required this.coverPhotoUrl,
    required this.likeCount,
    required this.ingredients,
    required this.cookingSteps,
    this.category,
    this.isLiked = false,
  });
}

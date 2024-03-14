import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe_category.dart';

class Recipe {
  final String id;
  final User user;
  final String title;
  final String description;
  final int minCookingTimeInMinutes;
  final String coverPhotoUrl;
  final int likeCount;
  final List<String> ingredients;
  final List<CookingStep> steps;
  final RecipeCategory? category;

  Recipe({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.minCookingTimeInMinutes,
    required this.coverPhotoUrl,
    required this.likeCount,
    required this.ingredients,
    required this.steps,
    this.category,
  });
}

class CookingStep {
  final int step;
  final String description;
  final String photoUrl;

  CookingStep({
    required this.step,
    required this.description,
    required this.photoUrl,
  });
}

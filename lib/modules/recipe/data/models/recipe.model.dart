import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.id,
    required super.user,
    required super.title,
    required super.description,
    required super.minCookingTimeInMinutes,
    required super.coverPhotoUrl,
    required super.likeCount,
    required super.ingredients,
    required super.steps,
    super.category,
  });
}


import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/cooking_step.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';

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
    required super.cookingSteps,
    super.category,
    super.isLiked = false,
  });

  factory RecipeModel.fromDataSource({
      required Map<String, dynamic> data,
      required User user,
      required RecipeCategory? category,
      required List<String> likedRecipes, 
    }) {
      return RecipeModel(
        id: data['id'],
        user: user,
        title: data['title'],
        description: data['description'],
        minCookingTimeInMinutes: data['duration_in_minutes'],
        coverPhotoUrl: data['cover_photo_url'],
        likeCount: data['like_count'],
        ingredients: List<String>.from(data['ingredients'].map((e) => e)),
        cookingSteps: List<CookingStepModel>.from(
          data['cooking_steps'].map((e) => CookingStepModel.fromMap(e)),
        ),
        category: category,
        isLiked: likedRecipes.contains(data['id']),
      );
    }
}

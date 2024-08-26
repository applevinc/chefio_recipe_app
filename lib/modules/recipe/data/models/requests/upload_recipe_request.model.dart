import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/upload_recipe.request.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class UploadRecipeRequestModel extends UploadRecipeRequest {
  late final String recipeId;

  UploadRecipeRequestModel({
    required super.coverPhoto,
    required super.foodName,
    required super.description,
    required super.duration,
    required super.ingredients,
    required super.cookingSteps,
  }) {
    recipeId = getGuid();
  }

  factory UploadRecipeRequestModel.fromEntity(UploadRecipeRequest request) {
    return UploadRecipeRequestModel(
      coverPhoto: request.coverPhoto,
      foodName: request.foodName,
      description: request.description,
      duration: request.duration,
      ingredients: request.ingredients,
      cookingSteps: request.cookingSteps,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': recipeId,
      'user_id': AppSession.authUser?.id,
      'title': foodName,
      'description': description,
      'ingredients': ingredients,
      'duration_in_minutes': duration.inMinutes,
      'like_count': 0,
    };
  }
}

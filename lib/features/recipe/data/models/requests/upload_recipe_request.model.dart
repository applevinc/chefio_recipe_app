import 'package:chefio_recipe_app/features/recipe/domain/entities/requests/upload_recipe.request.dart';

class UploadRecipeRequestModel extends UploadRecipeRequest {
  UploadRecipeRequestModel({
    required super.coverPhoto,
    required super.foodName,
    required super.description,
    required super.duration,
    required super.ingredients,
    required super.cookingSteps,
  });

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
}

import 'dart:io';

class UploadRecipeRequest {
  final File coverPhoto;
  final String foodName;
  final String description;
  final Duration duration;
  final List<String> ingredients;
  final List<CreateCookingStepRequest> cookingSteps;

  UploadRecipeRequest({
    required this.coverPhoto,
    required this.foodName,
    required this.description,
    required this.duration,
    required this.ingredients,
    required this.cookingSteps,
  });
}

class CreateCookingStepRequest {
  final int step;
  final String description;
  final File? photo;

  CreateCookingStepRequest({
    required this.step,
    required this.description,
    required this.photo,
  });
}

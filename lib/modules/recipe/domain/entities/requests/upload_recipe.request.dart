import 'dart:io';

class UploadRecipeRequest {
  final File coverPhoto;
  final String foodName;
  final String description;
  final Duration duration;
  final List<String> ingredients;
  final List<UploadCookingStepRequest> cookingSteps;

  UploadRecipeRequest({
    required this.coverPhoto,
    required this.foodName,
    required this.description,
    required this.duration,
    required this.ingredients,
    required this.cookingSteps,
  });
}

class UploadCookingStepRequest {
  int step;
  String description;
  File? photo;

  UploadCookingStepRequest({
    required this.step,
    required this.description,
    this.photo,
  });
}

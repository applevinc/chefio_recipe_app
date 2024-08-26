import 'dart:io';

import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/cooking_step.request.dart';

class UploadRecipeRequest {
  final File coverPhoto;
  final String foodName;
  final String description;
  final Duration duration;
  final List<String> ingredients;
  List<CookingStepRequest> cookingSteps;

  UploadRecipeRequest({
    required this.coverPhoto,
    required this.foodName,
    required this.description,
    required this.duration,
    required this.ingredients,
    this.cookingSteps = const [],
  });
}

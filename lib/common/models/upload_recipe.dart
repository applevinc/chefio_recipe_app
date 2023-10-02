import 'dart:io';

import 'package:chefio_recipe_app/utils/utils.dart';

class UploadRecipeIngredient {
  final String id;
  String name;

  UploadRecipeIngredient({required this.id, required this.name});

  factory UploadRecipeIngredient.create() {
    return UploadRecipeIngredient(id: Utils.getGuid(), name: '');
  }
}

class UploadRecipeCookingStep {
  final String id;
  String description;
  File? photo;

  UploadRecipeCookingStep({
    required this.id,
    required this.description,
    this.photo,
  });

  factory UploadRecipeCookingStep.create() {
    return UploadRecipeCookingStep(
      id: Utils.getGuid(),
      description: '',
      photo: null,
    );
  }
}

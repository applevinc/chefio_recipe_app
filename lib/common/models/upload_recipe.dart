import 'dart:io';

import 'package:chefio_recipe_app/utils/functions.dart';

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
      id: getGuid(),
      description: '',
      photo: null,
    );
  }
}

import 'package:chefio_recipe_app/modules/recipe/domain/entities/cooking_step.dart';

class CookingStepModel extends CookingStep {
  CookingStepModel({
    required super.step,
    required super.description,
    required super.photoUrl,
  });

  factory CookingStepModel.fromMap(Map<String, dynamic> map) {
    return CookingStepModel(
      step: map['step'],
      description: map['description'],
      photoUrl: map['photo_url'],
    );
  }
}

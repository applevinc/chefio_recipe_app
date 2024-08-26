import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/cooking_step.request.dart';

class CookingStepRequestModel extends CookingStepRequest {
  final String? photoUrl;

  CookingStepRequestModel({
    required super.step,
    required super.description,
    required super.photo,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'step': step,
      'description': description,
      'photo_url': photoUrl,
    };
  }

  CookingStepRequestModel copyWith({
    int? step,
    String? description,
    String? photoUrl,
  }) {
    return CookingStepRequestModel(
      step: step ?? this.step,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      photo: photo,
    );
  }
}

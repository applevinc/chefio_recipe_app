
import 'package:chefio_recipe_app/features/auth/domain/entities/create_profile.request.dart';

class CreateProfileRequestModel extends CreateProfileRequest {
  CreateProfileRequestModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.image,
  });

  static fromEntity(CreateProfileRequest request) {
    return CreateProfileRequestModel(
      firstName: request.firstName,
      lastName: request.lastName,
      email: request.email,
      password: request.password,
      image: request.image,
    );
  }
}

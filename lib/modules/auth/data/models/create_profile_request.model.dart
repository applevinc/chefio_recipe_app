import 'package:chefio_recipe_app/modules/auth/domain/entities/create_profile.request.dart';

class CreateProfileRequestModel extends CreateProfileRequest {
  CreateProfileRequestModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.image,
  });

  static fromEntity(CreateProfileRequest request) {
    return CreateProfileRequestModel(
      firstName: request.firstName,
      lastName: request.lastName,
      email: request.email,
      image: request.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
    };
  }
}

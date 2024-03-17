import 'dart:io';

import 'package:chefio_recipe_app/features/auth/domain/entities/create_profile.request.dart';

class CreateProfileRequestModel extends CreateProfileRequest {
  CreateProfileRequestModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.image,
  });
}

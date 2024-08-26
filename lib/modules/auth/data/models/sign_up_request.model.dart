import 'package:chefio_recipe_app/modules/auth/domain/entities/sign_up.request.dart';

class SignUpRequestModel extends SignUpRequest {
  SignUpRequestModel({
    required super.email,
    required super.password,
  });

  static fromEntity(SignUpRequest request) {
    return SignUpRequestModel(
      email: request.email,
      password: request.password,
    );
  }
}

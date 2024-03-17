import 'package:chefio_recipe_app/features/auth/domain/entities/sign_up.request.dart';

class SignUpRequestModel extends SignUpRequest {
  SignUpRequestModel({
    required super.email,
    required super.password,
  });
}

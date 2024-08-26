import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_sign_up.request.dart';

class ConfirmSignUpRequestModel extends ConfirmSignUpRequest {
  ConfirmSignUpRequestModel({
    required super.otp,
    required super.email,
  });

  static fromEntity(ConfirmSignUpRequest request) {
    return ConfirmSignUpRequestModel(
      otp: request.otp,
      email: request.email,
    );
  }
}

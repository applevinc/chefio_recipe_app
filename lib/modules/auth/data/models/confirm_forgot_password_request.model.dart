import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_forgot_password.request.dart';

class ConfirmForgotPasswordRequestModel extends ConfirmForgotPasswordRequest {
  ConfirmForgotPasswordRequestModel({
    required super.otp,
    required super.email,
  });

  static fromEntity(ConfirmForgotPasswordRequest request) {
    return ConfirmForgotPasswordRequestModel(
      otp: request.otp,
      email: request.email,
    );
  }
}

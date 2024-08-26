import 'package:chefio_recipe_app/modules/auth/domain/entities/reset_password.request.dart';

class ResetPasswordRequestModel extends ResetPasswordRequest {
  ResetPasswordRequestModel({
    required super.newPassword,
  });

  static fromEntity(ResetPasswordRequest request) {
    return ResetPasswordRequestModel(newPassword: request.newPassword);
  }
}

import 'package:chefio_recipe_app/features/auth/domain/entities/confirm_sign_up.request.dart';

class ConfirmSignUpRequestModel extends ConfirmSignUpRequest {
  ConfirmSignUpRequestModel({
    required super.otp,
    required super.email,
  });
}

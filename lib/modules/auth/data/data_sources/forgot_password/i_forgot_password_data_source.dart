import 'package:chefio_recipe_app/modules/auth/data/models/confirm_forgot_password_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/reset_password_request.model.dart';

abstract class IForgotPasswordDataSource {
 Future<void> sendOtp({required String email});
  Future<void> confirm(ConfirmForgotPasswordRequestModel request);
  Future<void> resetPassword(ResetPasswordRequestModel request);
}
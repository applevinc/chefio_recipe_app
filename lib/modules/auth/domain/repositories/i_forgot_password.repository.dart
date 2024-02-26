import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_forgot_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/reset_password.request.dart';

abstract class IForgotPasswordRepository {
  Future<void> sendOtp({required String email});
  Future<void> confirm(ConfirmForgotPasswordRequest request);
  Future<void> resetPassword(ResetPasswordRequest request);
}

import 'package:chefio_recipe_app/features/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/features/auth/data/models/confirm_forgot_password_request.model.dart';
import 'package:chefio_recipe_app/features/auth/data/models/reset_password_request.model.dart';

class ForgotPasswordDataSource implements IForgotPasswordDataSource {
  @override
  Future<void> confirm(ConfirmForgotPasswordRequestModel request) {
    // TODO: implement confirm
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel request) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> sendOtp({required String email}) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }
}

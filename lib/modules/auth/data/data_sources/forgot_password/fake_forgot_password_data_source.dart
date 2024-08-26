import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/confirm_forgot_password_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/reset_password_request.model.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeForgotPasswordDataSource implements IForgotPasswordDataSource {
  @override
  Future<void> confirm(ConfirmForgotPasswordRequestModel request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> sendOtp({required String email}) async {
    await fakeNetworkDelay();
  }
}

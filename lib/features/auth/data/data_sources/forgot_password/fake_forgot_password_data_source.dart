import 'package:chefio_recipe_app/features/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/features/auth/data/models/confirm_forgot_password_request.model.dart';
import 'package:chefio_recipe_app/features/auth/data/models/reset_password_request.model.dart';
import 'package:chefio_recipe_app/features/auth/domain/entities/confirm_forgot_password.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/entities/reset_password.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_forgot_password.repository.dart';
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

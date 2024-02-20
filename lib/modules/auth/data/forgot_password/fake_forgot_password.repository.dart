import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_forgot_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/reset_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeForgotPasswordRepository implements IForgotPasswordRepository {
  @override
  Future<void> confirm(ConfirmForgotPasswordRequest request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> sendOtp({required String email}) async {
    await fakeNetworkDelay();
  }
}

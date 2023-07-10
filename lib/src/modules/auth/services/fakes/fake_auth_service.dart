import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';

class FakeAuthService implements IAuthService {
  @override
  Future<void> resetPassword({required String newPassword}) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> verifyNewUser({required String email}) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> verifyOtp(int token) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await fakeNetworkDelay();
  }
}

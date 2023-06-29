import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/auth_service.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';

class FakeAuthService implements IAuthService {
  @override
  Future<void> resetPassword({required String newPassword}) async {
    await Future.delayed(networkDelay);
  }

  @override
  Future<void> sendOtp({required String email}) async {
    await Future.delayed(networkDelay);
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(networkDelay);
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await Future.delayed(networkDelay);
  }

  @override
  Future<void> verifyOtp(int token) async {
    await Future.delayed(networkDelay);
  }
}

import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/data/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:chefio_recipe_app/utils/utils.dart';

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
    required String username,
    required String password,
  }) async {
    await fakeNetworkDelay();
    AppSession.authUser = User(
      id: getGuid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.firstName(),
      recipeCount: random.nextInt(50),
      followingCount: random.nextInt(2000),
      followersCount: random.nextInt(2000),
      photoUrl: getOneProfilePhoto(),
    );
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

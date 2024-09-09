import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeSignInDataSource implements ISignInDataSource {
  @override
  Future<void> signIn({required String email, required String password}) async {
    await fakeNetworkDelay();
    final user = User(
      id: getGuid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.firstName(),
      email: email,
      recipeCount: random.nextInt(50),
      followingCount: random.nextInt(2000),
      followersCount: random.nextInt(2000),
      photoUrl: getOneProfilePhoto(),
    );
    AppSession.authUser = user;

    if (!user.hasCompletedProfile) {
      throw InCompleteProfileFailure();
    }
  }
}

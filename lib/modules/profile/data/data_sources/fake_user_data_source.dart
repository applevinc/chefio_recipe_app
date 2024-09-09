import 'package:chefio_recipe_app/modules/profile/data/data_sources/i_user_data_source.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeUserDataSource implements IUserDataSource {
  @override
  Future<void> updateFollowStatus({required String userId, required bool isFollowing}) async {
    await fakeNetworkDelay();
  }
}

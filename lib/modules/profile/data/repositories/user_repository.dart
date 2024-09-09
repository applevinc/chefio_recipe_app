import 'package:chefio_recipe_app/modules/profile/data/data_sources/i_user_data_source.dart';
import 'package:chefio_recipe_app/modules/profile/domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  UserRepository({required IUserDataSource dataSource}) : _dataSource = dataSource;

  final IUserDataSource _dataSource;

  @override
  Future<void> updateFollowStatus({required String userId, required bool isFollowing}) async {
    await _dataSource.updateFollowStatus(userId: userId, isFollowing: isFollowing);
  }
}

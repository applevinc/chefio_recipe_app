abstract class IUserDataSource {
  Future<void> updateFollowStatus({
    required String userId,
    required bool isFollowing,
  });
}

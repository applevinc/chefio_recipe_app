import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/services/firebase_utils.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/modules/profile/data/data_sources/i_user_data_source.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class UserDataSource implements IUserDataSource {
  @override
  Future<void> updateFollowStatus({required String userId, required bool isFollowing}) async {
    if (AppSession.authUser == null) {
      throw Failure('User is not logged in');
    }

    try {
      // Update logged in user's following_ids
      final loggedInUserRef = usersCollection.doc(AppSession.authUser?.id);
      final followingIds = await FirebaseUtils.getFollowingUserIds();
      if (isFollowing) {
        followingIds.add(userId);
      } else {
        followingIds.remove(userId);
      }
      await loggedInUserRef.update({'following': followingIds});

      // Update other user's follower count
      final otherUserRef = usersCollection.doc(userId);
      final otherUserSnapshot = await otherUserRef.get();
      int followerCount = otherUserSnapshot.data()?['followers_count'] ?? 0;
      if (isFollowing) {
        followerCount++;
      } else {
        followerCount--;
      }

      await otherUserRef.update({'followers_count': followerCount});
    } catch (e, s) {
      logError(e, s, source: 'UserDataSource.updateFollowStatus');
      throw Failure('Failed to update follow status');
    }
  }
}

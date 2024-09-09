import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/profile/domain/repositories/i_user_repository.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

class ProfileController extends ViewController {
  ProfileController(this.user, {required IUserRepository userRepository})
      : _userRepository = userRepository;

  final User user;

  final IUserRepository _userRepository;

  bool? get isAuthUserProfile {
    final User? authUser = AppSession.authUser;

    if (authUser == null) return null;

    if (user.id == authUser.id) {
      return true;
    }

    return false;
  }

  Future<void> updateFollowStatus() async {
    final currentStatus = user.isFollowing ?? false;
    user.isFollowing = !currentStatus;
    user.followersCount += user.isFollowing! ? 1 : -1;
    notifyListeners();

    try {
      await _userRepository.updateFollowStatus(
        userId: user.id,
        isFollowing: user.isFollowing!,
      );
    } catch (e) {
      user.isFollowing = currentStatus;
      user.followersCount -= user.isFollowing! ? 1 : -1;
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}

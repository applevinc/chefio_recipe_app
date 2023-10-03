import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/utils/base_viewmodel.dart';

class ProfileViewModel extends BaseViewModel {
  late final User user;

  ProfileViewModel(this.user);

  bool? get isAuthUserProfile {
    final User? authUser = AppSession.authUser;

    if (authUser == null) return null;

    if (user.id == authUser.id) {
      return true;
    }

    return false;
  }
}

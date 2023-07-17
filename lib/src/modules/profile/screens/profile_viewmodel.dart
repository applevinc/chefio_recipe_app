import 'package:chefio_recipe_app/src/config/app_session.dart';
import 'package:chefio_recipe_app/src/shared/models/user.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class ProfileViewModel extends BaseViewModel {
  late final User user;

  ProfileViewModel(this.user);

  bool? get isAuthUserProfile {
    final User? authUser = AppSession.user;

    if (authUser == null) return null;

    if (user.id == authUser.id) {
      return true;
    }

    return false;
  }
}

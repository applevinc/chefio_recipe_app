import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';

class ProfileController extends ViewController {
  late final User user;

  ProfileController(this.user);

  bool? get isAuthUserProfile {
    final User? authUser = AppSession.authUser;

    if (authUser == null) return null;

    if (user.id == authUser.id) {
      return true;
    }

    return false;
  }
}

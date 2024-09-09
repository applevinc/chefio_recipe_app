import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';

class AppSession {
  AppSession._();

  static User? authUser;
  static bool isLoggedIn = false;
}

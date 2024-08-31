import 'package:chefio_recipe_app/core/models/user.dart';

class AppSession {
  AppSession._();

  static User? authUser;
  static bool isLoggedIn = false;
}

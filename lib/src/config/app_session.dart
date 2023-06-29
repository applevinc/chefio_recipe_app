import 'package:chefio_recipe_app/src/shared/models/user.dart';

class AppSession {
  AppSession._();

  static User? user;
  static bool isLoggedIn = false;
}

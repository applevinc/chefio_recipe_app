import 'package:chefio_recipe_app/common/models/user.dart';

class AppSession {
  AppSession._();

  static User? user;
  static bool isLoggedIn = false;
}

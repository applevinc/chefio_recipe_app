import 'package:chefio_recipe_app/src/shared/models/user.dart';

class DataStore {
  DataStore._();

  static User? user;
  static bool isLoggedIn = false;
}

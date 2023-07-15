import 'package:chefio_recipe_app/src/shared/models/user.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class ProfileViewModel extends BaseViewModel {
  late final User user;

  ProfileViewModel(this.user);
}

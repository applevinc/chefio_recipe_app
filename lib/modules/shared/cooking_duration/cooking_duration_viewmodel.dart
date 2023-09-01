import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

class CookingDurationViewModel extends BaseViewModel {
  double _duration = 0.0;
  double get duration => _duration;

  void setDuration(double value) {
    _duration = value;
    notifyListeners();
  }
}

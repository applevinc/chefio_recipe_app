import 'package:chefio_recipe_app/utils/view.controller.dart';

class PasswordStrengthController extends ViewController {
  bool _containsSixCharacters = false;

  bool get containsSixCharacters => _containsSixCharacters;

  bool _containsNumber = false;

  bool get containsNumber => _containsNumber;

  void validate(String value) {
    _validateLength(value);
    _validatePasswordWithNumber(value);
    notifyListeners();
  }

  void _validateLength(String value) {
    final regex = RegExp(r'.{6,}$');

    if (regex.hasMatch(value)) {
      _containsSixCharacters = true;
    } else {
      _containsSixCharacters = false;
    }
  }

  void _validatePasswordWithNumber(String value) {
    final regex = RegExp(r'.*\d.*');

    if (regex.hasMatch(value)) {
      _containsNumber = true;
    } else {
      _containsNumber = false;
    }
  }
}

import 'package:chefio_recipe_app/modules/auth/screens/password_validator/password_validator_helper.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/shared/models/failure.dart';

class SignUpViewModel extends PasswordValidatorHelper {
  final IAuthService _authService;

  SignUpViewModel({required IAuthService authService}) : _authService = authService;

  Future<void> execute({required String email, required String password}) async {
    if (containsNumber == false) throw Failure('Your password does not contain a number');

    if (containsSixCharacters == false)
      throw Failure('Your password is not strong enough');

    try {
      setBusy(true);
      await _authService.signUp(email: email, password: password);
    } finally {
      setBusy(false);
    }
  }
}

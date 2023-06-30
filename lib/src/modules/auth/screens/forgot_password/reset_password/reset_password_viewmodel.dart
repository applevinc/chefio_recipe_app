import 'package:chefio_recipe_app/src/modules/auth/screens/password_validator/password_validator_helper.dart';
import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';

class ResetPasswordViewModel extends PasswordValidatorHelper {
  final IAuthService _authService;

  ResetPasswordViewModel({required IAuthService authService}) : _authService = authService;

  Future<void> execute({required String password}) async {
    try {
      setBusy(true);
      await _authService.resetPassword(newPassword: password);
    } finally {
      setBusy(false);
    }
  }
}

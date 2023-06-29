import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class ResetPasswordViewModel extends BaseViewModel {
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

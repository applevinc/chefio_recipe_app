import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class ConfirmForgotPasswordViewModel extends BaseViewModel {
  final IAuthService _authService;

  ConfirmForgotPasswordViewModel({required IAuthService authService}) : _authService = authService;

  Future<void> execute({required String pin}) async {
    if (pin.isEmpty) throw InternalFailure();

    try {
      setBusy(true);
      await _authService.verifyOtp(int.parse(pin));
    } finally {
      setBusy(false);
    }
  }
}

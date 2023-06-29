import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {
  final IAuthService _authService;

  SignUpViewModel({required IAuthService authService}) : _authService = authService;

  Future<void> execute({required String email, required String password}) async {
    try {
      setBusy(true);
      await _authService.signUp(email: email, password: password);
    } finally {
      setBusy(false);
    }
  }
}

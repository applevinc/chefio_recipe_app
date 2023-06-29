import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/auth_service.dart';
import 'package:chefio_recipe_app/src/shared/controllers/base_controller.dart';

class SignInViewModel extends BaseController {
  SignInViewModel({required IAuthService authService}) : _authService = authService;

  final IAuthService _authService;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      setBusy(true);
      await _authService.signIn(email: email, password: password);
    } finally {
      setBusy(false);
    }
  }
}

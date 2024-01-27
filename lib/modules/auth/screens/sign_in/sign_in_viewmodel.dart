import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/utils/base.controller.dart';

class SignInViewModel extends BaseController {
  SignInViewModel({required IAuthService authService}) : _authService = authService;

  final IAuthService _authService;

  Future<void> execute({
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

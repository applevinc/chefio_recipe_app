import 'package:chefio_recipe_app/src/modules/auth/services/services.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState { initial, loading, loaded }

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(AuthState.initial, authService: FakeAuthServiceImpl());
});

class AuthController extends StateNotifier<AuthState> {
  AuthController(AuthState state, {required this.authService}) : super(state);

  final IAuthService authService;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      state = AuthState.loading;
      await authService.signIn(email: email, password: password);
      state = AuthState.loaded;
    } on Failure {
      state = AuthState.loaded;
      rethrow;
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      state = AuthState.loading;
      await authService.signUp(email: email, password: password);
      state = AuthState.loaded;
    } on Failure {
      state = AuthState.loaded;
      rethrow;
    }
  }
}

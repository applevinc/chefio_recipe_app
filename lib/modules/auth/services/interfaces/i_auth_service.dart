abstract class IAuthService {
  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> verifyNewUser({required String email});

  Future<void> verifyOtp(int token);

  Future<void> forgotPassword({required String email});

  Future<void> resetPassword({required String newPassword});
}

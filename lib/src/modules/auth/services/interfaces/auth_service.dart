abstract class IAuthService {
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> signUp({
    required String email,
    required String password,
  });
  Future<void> sendOtp({
    required String email,
  });
  Future<void> verifyOtp(int token);
  Future<void> resetPassword({
    required String newPassword,
  });
}

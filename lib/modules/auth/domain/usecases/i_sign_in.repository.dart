abstract class ISignInRepository {
  Future<void> signIn({
    required String email,
    required String password,
  });
}

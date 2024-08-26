abstract class ISignInDataSource {
  Future<void> signIn({
    required String email,
    required String password,
  });
}

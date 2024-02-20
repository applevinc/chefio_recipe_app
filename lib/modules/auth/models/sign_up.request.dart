class SignUpRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}

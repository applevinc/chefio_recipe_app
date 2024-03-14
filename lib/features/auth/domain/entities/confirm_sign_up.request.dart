class ConfirmSignUpRequest {
  final String otp;
  final String email;

  ConfirmSignUpRequest({
    required this.otp,
    required this.email,
  });
}

class ConfirmForgotPasswordRequest {
  final String otp;
  final String email;

  ConfirmForgotPasswordRequest({
    required this.otp,
    required this.email,
  });
}

import 'package:chefio_recipe_app/modules/auth/view/otp/otp.controller.dart';
import 'package:chefio_recipe_app/modules/auth/data/interfaces/i_auth_service.dart';

class ConfirmForgotPasswordViewModel extends OtpController {
  ConfirmForgotPasswordViewModel({
    required IAuthService authService,
    required super.email,
  }) : _authService = authService;

  final IAuthService _authService;

  @override
  Future<void> verify() async {
    try {
      setBusyForObject(OtpLoadingState.verify, true);
      await _authService.verifyOtp(int.parse(textController.text));
    } finally {
      setBusyForObject(OtpLoadingState.verify, false);
    }
  }

  @override
  Future<void> resendOtp() async {
    try {
      setBusyForObject(OtpLoadingState.resendOtp, true);
      await _authService.forgotPassword(email: email);
    } finally {
      setBusyForObject(OtpLoadingState.resendOtp, false);
    }
  }
}

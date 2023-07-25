import 'package:chefio_recipe_app/modules/auth/screens/otp_timer_helper.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/shared/models/failure.dart';

enum ConfirmForgotPasswordLoadingState { verify, resend }

class ConfirmForgotPasswordViewModel extends OtpTimerHelper {
  final IAuthService _authService;

  ConfirmForgotPasswordViewModel({required IAuthService authService})
      : _authService = authService;

  Future<void> execute({required String pin}) async {
    if (pin.isEmpty) throw InternalFailure();

    try {
      setBusyForObject(ConfirmForgotPasswordLoadingState.verify, true);
      await _authService.verifyOtp(int.parse(pin));
    } finally {
      setBusyForObject(ConfirmForgotPasswordLoadingState.verify, false);
    }
  }

  Future<void> resendOtp({required String email}) async {
    try {
      setBusyForObject(ConfirmForgotPasswordLoadingState.resend, true);
      await _authService.forgotPassword(email: email);
      initTimer();
    } finally {
      setBusyForObject(ConfirmForgotPasswordLoadingState.resend, false);
    }
  }
}

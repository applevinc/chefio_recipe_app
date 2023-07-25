import 'package:chefio_recipe_app/modules/auth/screens/otp_timer_helper.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/shared/models/failure.dart';

enum ConfirmSignUpLoadingState { verify, resend }

class ConfirmSignUpViewModel extends OtpTimerHelper {
  final IAuthService _authService;

  ConfirmSignUpViewModel({required IAuthService authService})
      : _authService = authService;

  Future<void> execute({required String pin}) async {
    if (pin.isEmpty) throw Failure('Pin cannot be empty');

    try {
      setBusyForObject(ConfirmSignUpLoadingState.verify, true);
      await _authService.verifyOtp(int.parse(pin));
    } finally {
      setBusyForObject(ConfirmSignUpLoadingState.verify, false);
    }
  }

  Future<void> resendOtp({required String email}) async {
    try {
      setBusyForObject(ConfirmSignUpLoadingState.resend, true);
      await _authService.verifyNewUser(email: email);
      initTimer();
    } finally {
      setBusyForObject(ConfirmSignUpLoadingState.resend, false);
    }
  }
}

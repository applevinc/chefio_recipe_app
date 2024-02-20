import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_forgot_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/otp/otp.controller.dart';

class ConfirmForgotPasswordController extends OtpController {
  ConfirmForgotPasswordController({
    required IForgotPasswordRepository forgotPasswordRepository,
    required super.email,
  }) : _forgotPasswordRepository = forgotPasswordRepository;

  final IForgotPasswordRepository _forgotPasswordRepository;

  @override
  Future<void> verify() async {
    final request = ConfirmForgotPasswordRequest(
      otp: textController.text.trim(),
      email: email,
    );

    try {
      setBusyForObject(OtpLoadingState.verify, true);
      await _forgotPasswordRepository.confirm(request);
    } finally {
      setBusyForObject(OtpLoadingState.verify, false);
    }
  }

  @override
  Future<void> resendOtp() async {
    try {
      setBusyForObject(OtpLoadingState.resendOtp, true);
      await _forgotPasswordRepository.sendOtp(email: email);
    } finally {
      setBusyForObject(OtpLoadingState.resendOtp, false);
    }
  }
}

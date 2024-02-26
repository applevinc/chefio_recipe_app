import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_sign_up.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/otp/otp.controller.dart';

class ConfirmSignUpController extends OtpController {
  ConfirmSignUpController({
    required ISignUpRepository signUpRepository,
    required super.email,
  }) : _signUpRepository = signUpRepository;

  final ISignUpRepository _signUpRepository;

  @override
  Future<void> verify() async {
    final request = ConfirmSignUpRequest(
      otp: textController.text.trim(),
      email: email,
    );

    try {
      setBusyForObject(OtpLoadingState.verify, true);
      await _signUpRepository.confirmSignUp(request);
    } finally {
      setBusyForObject(OtpLoadingState.verify, false);
    }
  }

  @override
  Future<void> resendOtp() async {
    try {
      setBusyForObject(OtpLoadingState.resendOtp, true);
      await _signUpRepository.resendOtp(email: email);
    } finally {
      setBusyForObject(OtpLoadingState.resendOtp, false);
    }
  }
}

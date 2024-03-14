import 'package:chefio_recipe_app/features/auth/domain/entities/confirm_sign_up.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/entities/sign_up.request.dart';

abstract class ISignUpRepository {
  Future<void> signUp(SignUpRequest request);
  Future<void> confirmSignUp(ConfirmSignUpRequest request);
  Future<void> resendOtp({required String email});
}

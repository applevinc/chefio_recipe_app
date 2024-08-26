import 'package:chefio_recipe_app/modules/auth/data/models/confirm_sign_up_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/create_profile_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/sign_up_request.model.dart';

abstract class ISignUpDataSource {
  Future<void> createProfile(CreateProfileRequestModel request);
  Future<void> signUp(SignUpRequestModel request);
  Future<void> confirmSignUp(ConfirmSignUpRequestModel request);
  Future<void> resendOtp({required String email});
}

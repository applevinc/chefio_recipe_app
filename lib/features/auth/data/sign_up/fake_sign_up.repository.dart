import 'package:chefio_recipe_app/features/auth/domain/entities/confirm_sign_up.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/entities/create_profile.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/entities/sign_up.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeSignUpRepository implements ISignUpRepository {
  @override
  Future<void> confirmSignUp(ConfirmSignUpRequest request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> resendOtp({required String email}) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> createProfile(CreateProfileRequest request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> signUp(SignUpRequest request) async {
    await fakeNetworkDelay();
  }
}

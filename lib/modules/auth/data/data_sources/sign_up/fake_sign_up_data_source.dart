import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/i_sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/confirm_sign_up_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/create_profile_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/sign_up_request.model.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeSignUpDataSource implements ISignUpDataSource {
  @override
  Future<void> confirmSignUp(ConfirmSignUpRequestModel request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> createProfile(CreateProfileRequestModel request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> resendOtp({required String email}) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> signUp(SignUpRequestModel request) async {
    await fakeNetworkDelay();
    AppSession.authUser = User(id: getGuid(), email: request.email);
  }
}

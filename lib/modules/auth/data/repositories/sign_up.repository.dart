import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/i_sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/confirm_sign_up_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/create_profile_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/sign_up_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_sign_up.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/create_profile.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/sign_up.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';

class SignUpRepository implements ISignUpRepository {
  SignUpRepository({required ISignUpDataSource dataSource}) : _dataSource = dataSource;

  final ISignUpDataSource _dataSource;

  @override
  Future<void> confirmSignUp(ConfirmSignUpRequest request) async {
    final requestModel = ConfirmSignUpRequestModel.fromEntity(request);
    await _dataSource.confirmSignUp(requestModel);
  }

  @override
  Future<void> createProfile(CreateProfileRequest request) async {
    final requestModel = CreateProfileRequestModel.fromEntity(request);
    await _dataSource.createProfile(requestModel);
  }

  @override
  Future<void> resendOtp({required String email}) async {
    await _dataSource.resendOtp(email: email);
  }

  @override
  Future<void> signUp(SignUpRequest request) async {
    final requestModel = SignUpRequestModel.fromEntity(request);
    await _dataSource.signUp(requestModel);
  }
}

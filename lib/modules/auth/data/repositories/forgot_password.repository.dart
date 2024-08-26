import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/confirm_forgot_password_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/reset_password_request.model.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/confirm_forgot_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/reset_password.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_forgot_password.repository.dart';

class ForgotPasswordRepository implements IForgotPasswordRepository {
  ForgotPasswordRepository({required IForgotPasswordDataSource dataSource})
      : _dataSource = dataSource;

  final IForgotPasswordDataSource _dataSource;

  @override
  Future<void> confirm(ConfirmForgotPasswordRequest request) async {
    final requestModel = ConfirmForgotPasswordRequestModel.fromEntity(request);
    await _dataSource.confirm(requestModel);
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    final requestModel = ResetPasswordRequestModel.fromEntity(request);
    await _dataSource.resetPassword(requestModel);
  }

  @override
  Future<void> sendOtp({required String email}) async {
    await _dataSource.sendOtp(email: email);
  }
}

import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_in.repository.dart';

class SignInRepository implements ISignInRepository {
  SignInRepository({required ISignInDataSource dataSource}) : _dataSource = dataSource;

  final ISignInDataSource _dataSource;

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _dataSource.signIn(email: email, password: password);
  }
}

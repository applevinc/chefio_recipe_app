import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/modules/auth/data/forgot_password/fake_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/data/sign_in/fake_sign_in.repository.dart';
import 'package:chefio_recipe_app/modules/auth/data/sign_up/fake_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_in.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/search/fake_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/search/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/fake_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:get_it/get_it.dart';

final GetIt devLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('Dev DI init....');
  devLocator.registerLazySingleton<AppConfig>(() => appConfig);

  devLocator.registerLazySingleton<IRecipeDataSource>(() => FakeRecipeDataSource());
  devLocator.registerLazySingleton<ISearchRecipeDataSource>(() => FakeSearchRecipeDataSource());
  devLocator.registerLazySingleton<ISignInRepository>(() => FakeSignInRepository());
  devLocator.registerLazySingleton<ISignUpRepository>(() => FakeSignUpRepository());
  devLocator.registerLazySingleton<IForgotPasswordRepository>(
      () => FakeForgotPasswordRepository());
}

import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/fake_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/fake_sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/fake_sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/i_sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/profile/data/data_sources/fake_user_data_source.dart';
import 'package:chefio_recipe_app/modules/profile/data/data_sources/i_user_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/fakes/fake_recipe_list_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/fakes/fake_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/fakes/fake_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_datasource.dart';
import 'package:get_it/get_it.dart';

final GetIt devLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('Dev DI init....');
  devLocator.registerLazySingleton<AppConfig>(() => appConfig);

  devLocator.registerLazySingleton<IRecipeDataSource>(
    () => FakeRecipeDataSource(),
  );

  devLocator.registerLazySingleton<IRecipeListDataSource>(
    () => FakeRecipeListDataSource(),
  );

  devLocator.registerLazySingleton<ISearchRecipeDataSource>(
    () => FakeSearchRecipeDataSource(),
  );

  devLocator.registerLazySingleton<ISignInDataSource>(
    () => FakeSignInDataSource(),
  );

  devLocator.registerLazySingleton<ISignUpDataSource>(
    () => FakeSignUpDataSource(),
  );

  devLocator.registerLazySingleton<IForgotPasswordDataSource>(
    () => FakeForgotPasswordDataSource(),
  );
  
  devLocator.registerLazySingleton<IUserDataSource>(
    () => FakeUserDataSource(),
  );
}

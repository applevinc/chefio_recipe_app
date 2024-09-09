import 'package:chefio_recipe_app/config/app_config.dart';

import 'package:chefio_recipe_app/core/services/file_service.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/i_sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/repositories/forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/data/repositories/sign_in.repository.dart';
import 'package:chefio_recipe_app/modules/auth/data/repositories/sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_in.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/profile/data/data_sources/i_user_data_source.dart';
import 'package:chefio_recipe_app/modules/profile/data/repositories/user_repository.dart';
import 'package:chefio_recipe_app/modules/profile/domain/repositories/i_user_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/repositories/recipe_list_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/data/repositories/recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/data/repositories/search_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_list_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt _diContainer = GetIt.instance;

final locator = _diContainer<GetIt>();

final baseUrl = locator<AppConfig>().baseUrl;

void initGlobalDI({required GetIt envLocator}) async {
  print('Global DI init....');
  _diContainer.registerLazySingleton<GetIt>(() => envLocator);

  locator.registerLazySingleton(() => FileService());

  locator.registerLazySingleton<ISignInRepository>(
    () => SignInRepository(
      dataSource: locator<ISignInDataSource>(),
    ),
  );

  locator.registerLazySingleton<ISignUpRepository>(
    () => SignUpRepository(
      dataSource: locator<ISignUpDataSource>(),
    ),
  );

  locator.registerLazySingleton<IForgotPasswordRepository>(
    () => ForgotPasswordRepository(
      dataSource: locator<IForgotPasswordDataSource>(),
    ),
  );

  locator.registerLazySingleton<IRecipeRepository>(
    () => RecipeRepository(
      dataSource: locator<IRecipeDataSource>(),
    ),
  );

  locator.registerLazySingleton<ISearchRecipeRepository>(
    () => SearchRecipeRepository(
      dataSource: locator<ISearchRecipeDataSource>(),
    ),
  );

  locator.registerLazySingleton<IRecipeListRepository>(
    () => RecipeListRepository(
      dataSource: locator<IRecipeListDataSource>(),
    ),
  );

  locator.registerLazySingleton<IUserRepository>(
    () => UserRepository(
      dataSource: locator<IUserDataSource>(),
    ),
  );
}

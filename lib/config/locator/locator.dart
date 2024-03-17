import 'package:chefio_recipe_app/config/app_config.dart';

import 'package:chefio_recipe_app/common/services/file_service.dart';
import 'package:chefio_recipe_app/features/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/features/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/features/auth/data/repositories/forgot_password.repository.dart';
import 'package:chefio_recipe_app/features/auth/data/repositories/sign_in.repository.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_sign_in.repository.dart';
import 'package:chefio_recipe_app/features/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/features/recipe/data/data_sources/search/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/features/recipe/data/repositories/recipe_repository.dart';
import 'package:chefio_recipe_app/features/recipe/data/repositories/search_recipe_repository.dart';
import 'package:chefio_recipe_app/features/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/features/recipe/domain/repositories/i_search_recipe_repository.dart';
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
}

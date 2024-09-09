import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/forgot_password/i_forgot_password_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/i_sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_in/sign_in_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/i_sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/auth/data/data_sources/sign_up/sign_up_data_source.dart';
import 'package:chefio_recipe_app/modules/profile/data/data_sources/i_user_data_source.dart';
import 'package:chefio_recipe_app/modules/profile/data/data_sources/user_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/impls/recipe_list_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/impls/recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/impls/search_recipe_data_source.dart';
import 'package:get_it/get_it.dart';

final GetIt prodLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('Prod DI init....');
  prodLocator.registerLazySingleton<AppConfig>(() => appConfig);

  prodLocator.registerLazySingleton<ISignUpDataSource>(
    () => SignUpDataSource(),
  );

  prodLocator.registerLazySingleton<IRecipeDataSource>(
    () => RecipeDataSource(),
  );

  prodLocator.registerLazySingleton<IRecipeListDataSource>(
    () => RecipeListDataSource(),
  );

  prodLocator.registerLazySingleton<ISearchRecipeDataSource>(
    () => SearchRecipeDataSource(),
  );

  prodLocator.registerLazySingleton<ISignInDataSource>(
    () => SignInDataSource(),
  );

  prodLocator.registerLazySingleton<IForgotPasswordDataSource>(
    () => ForgotPasswordDataSource(),
  );

  prodLocator.registerLazySingleton<IUserDataSource>(
    () => UserDataSource(),
  );
}

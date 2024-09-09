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

final GetIt qaLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('QA DI init....');
  qaLocator.registerLazySingleton<AppConfig>(() => appConfig);

  qaLocator.registerLazySingleton<ISignUpDataSource>(
    () => SignUpDataSource(),
  );

  qaLocator.registerLazySingleton<IRecipeDataSource>(
    () => RecipeDataSource(),
  );

  qaLocator.registerLazySingleton<IRecipeListDataSource>(
    () => RecipeListDataSource(),
  );

  qaLocator.registerLazySingleton<ISearchRecipeDataSource>(
    () => SearchRecipeDataSource(),
  );

  qaLocator.registerLazySingleton<ISignInDataSource>(
    () => SignInDataSource(),
  );

  qaLocator.registerLazySingleton<IForgotPasswordDataSource>(
    () => ForgotPasswordDataSource(),
  );

  qaLocator.registerLazySingleton<IUserDataSource>(
    () => UserDataSource(),
  );
}

import 'package:chefio_recipe_app/common/services/category/fake_category_service.dart';
import 'package:chefio_recipe_app/common/services/category/i_category_service.dart';
import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/modules/auth/data/fakes/fake_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/data/forgot_password/fake_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/data/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/data/sign_in/fake_sign_in.repository.dart';
import 'package:chefio_recipe_app/modules/auth/data/sign_up/fake_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_forgot_password.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_sign_in.repository.dart';
import 'package:chefio_recipe_app/modules/auth/domain/usecases/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/home/services/fake_search_service.dart';
import 'package:chefio_recipe_app/modules/home/services/i_search_service.dart';
import 'package:chefio_recipe_app/common/services/recipe/fake_recipe_service.dart';
import 'package:chefio_recipe_app/common/services/recipe/i_recipe_service.dart';
import 'package:get_it/get_it.dart';

final GetIt devLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('Dev DI init....');
  devLocator.registerLazySingleton<AppConfig>(() => appConfig);

  //service
  devLocator.registerLazySingleton<ICategoryService>(() => FakeCategoryService());
  devLocator.registerLazySingleton<IRecipeService>(() => FakeRecipeService());
  devLocator.registerLazySingleton<ISearchService>(() => FakeSearchService());

  devLocator.registerLazySingleton<ISignInRepository>(() => FakeSignInRepository());
  devLocator.registerLazySingleton<ISignUpRepository>(() => FakeSignUpRepository());
  devLocator.registerLazySingleton<IForgotPasswordRepository>(
      () => FakeForgotPasswordRepository());
}

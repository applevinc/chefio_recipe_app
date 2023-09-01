import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/modules/auth/services/fakes/fake_auth_service.dart';
import 'package:chefio_recipe_app/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/modules/home/services/fake_search_service.dart';
import 'package:chefio_recipe_app/modules/home/services/i_search_service.dart';
import 'package:chefio_recipe_app/modules/shared/category/services/fake_category_service.dart';
import 'package:chefio_recipe_app/modules/shared/category/services/i_category_service.dart';
import 'package:chefio_recipe_app/modules/recipe/services/fake_recipe_service.dart';
import 'package:chefio_recipe_app/modules/recipe/services/i_recipe_service.dart';
import 'package:get_it/get_it.dart';

final GetIt devLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('Dev DI init....');
  devLocator.registerLazySingleton<AppConfig>(() => appConfig);

  //service
  devLocator.registerLazySingleton<IAuthService>(() => FakeAuthService());
  devLocator.registerLazySingleton<ICategoryService>(() => FakeCategoryService());
  devLocator.registerLazySingleton<IRecipeService>(() => FakeRecipeService());
  devLocator.registerLazySingleton<ISearchService>(() => FakeSearchService());
}

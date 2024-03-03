import 'package:chefio_recipe_app/config/app_config.dart';

import 'package:chefio_recipe_app/common/services/file_service.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/search/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/repositories/recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/data/repositories/search_recipe_repository.dart';
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

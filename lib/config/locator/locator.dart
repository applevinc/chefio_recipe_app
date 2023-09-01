import 'package:chefio_recipe_app/config/app_config.dart';

import 'package:chefio_recipe_app/modules/home/screens/home_viewmodel.dart';
import 'package:chefio_recipe_app/modules/shared/category/services/i_category_service.dart';
import 'package:chefio_recipe_app/modules/recipe/services/i_recipe_service.dart';
import 'package:chefio_recipe_app/shared/image/service/file_service.dart';
import 'package:chefio_recipe_app/shared/image/service/i_file_service.dart';
import 'package:get_it/get_it.dart';

final GetIt _diContainer = GetIt.instance;

final locator = _diContainer<GetIt>();
final baseUrl = locator<AppConfig>().baseUrl;

void initGlobalDI({required GetIt envLocator}) async {
  print('Global DI init....');
  _diContainer.registerLazySingleton<GetIt>(() => envLocator);

  locator.registerLazySingleton<IFileService>(() => FileService());

  // controllers
  locator.registerLazySingleton(
    () => HomeViewModel(
      categoryService: locator<ICategoryService>(),
      recipeService: locator<IRecipeService>(),
    ),
  );
}

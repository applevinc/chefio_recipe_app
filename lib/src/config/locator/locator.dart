import 'package:chefio_recipe_app/src/config/app_config.dart';
import 'package:get_it/get_it.dart';

final GetIt _diContainer = GetIt.instance;

final locator = _diContainer<GetIt>();
final baseUrl = locator<AppConfig>().baseUrl;

void initGlobalDI({required GetIt envDiContainer}) async {
  print('Global DI init....');
  _diContainer.registerLazySingleton<GetIt>(() => envDiContainer);

//  locator.registerLazySingleton(() => FileController(imageService: locator()));
//  locator.registerLazySingleton<IFileService>(() => FileService());

  // controllers
  /* locator.registerLazySingleton(
      () => HomeController(dashBoardService: locator<IDashBoardService>()));
  locator.registerLazySingleton(
      () => SplashScreenController(authService: locator<IAuthService>()));
      */
}

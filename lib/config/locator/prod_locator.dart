import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:get_it/get_it.dart';

final GetIt prodLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('Prod DI init....');
  prodLocator.registerLazySingleton<AppConfig>(() => appConfig);

  //service
}

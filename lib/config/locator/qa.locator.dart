import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:get_it/get_it.dart';

final GetIt qaLocator = GetIt.instance;

void initContainers({required AppConfig appConfig}) async {
  print('QA DI init....');
  qaLocator.registerLazySingleton<AppConfig>(() => appConfig);
}

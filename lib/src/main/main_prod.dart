import 'package:chefio_recipe_app/src/app.dart';
import 'package:chefio_recipe_app/src/config/app_config.dart';
import 'package:chefio_recipe_app/src/config/locator/locator.dart';
import 'package:chefio_recipe_app/src/config/locator/prod_locator.dart';
import 'package:chefio_recipe_app/src/config/providers_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    final config = AppConfig(
      appEnvironment: AppEnvironment.prod,
      appName: appName,
      diContainer: prodLocator,
      baseUrl: null,
    );
    initGlobalDI(envDiContainer: config.diContainer);
    initContainers(appConfig: config);
    runApp(const ProvidersWrapper(child: ChefioApp()));
  });
}

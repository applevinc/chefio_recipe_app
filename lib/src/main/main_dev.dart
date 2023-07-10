import 'package:chefio_recipe_app/src/app.dart';
import 'package:chefio_recipe_app/src/config/app_config.dart';
import 'package:chefio_recipe_app/src/config/locator/dev_locator.dart';
import 'package:chefio_recipe_app/src/config/locator/locator.dart';
import 'package:chefio_recipe_app/src/config/providers_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    final config = AppConfig(
      appEnvironment: AppEnvironment.dev,
      appName: '$appName(dev)',
      diContainer: devLocator,
    );
    initGlobalDI(envLocator: config.diContainer);
    initContainers(appConfig: config);
    runApp(const ProvidersWrapper(child: ChefioApp()));
  });
}

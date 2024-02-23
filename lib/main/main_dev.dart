import 'package:chefio_recipe_app/app.dart';
import 'package:chefio_recipe_app/config/app_config.dart';
import 'package:chefio_recipe_app/config/locator/dev.locator.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/config/providers_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    final config = AppConfig(
      appEnvironment: AppEnvironment.dev,
      appName: '$appName(dev)',
      diContainer: devLocator,
    );
    initGlobalDI(envLocator: config.diContainer);
    initContainers(appConfig: config);
    runApp(const ProvidersWrapper(child: App()));
  });
}

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum AppEnvironment { dev, qa, prod }

class AppConfig {
  final AppEnvironment appEnvironment;
  final GetIt diContainer;
  final String appName;
  final String? description;
  final String? baseUrl;
  final String? apiVersion;
  final ThemeData? themeData;

  const AppConfig({
    required this.appEnvironment,
    required this.diContainer,
    required this.appName,
    this.description,
    this.baseUrl,
    this.apiVersion,
    this.themeData,
  });
}

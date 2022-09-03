import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static void to(BuildContext context, Widget nextScreen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget nextScreen) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => nextScreen),
      (Route<dynamic> route) => false,
    );
  }
}

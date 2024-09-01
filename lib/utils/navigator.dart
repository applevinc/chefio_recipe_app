import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  Future<dynamic> push(Widget nextScreen) async {
    return await Navigator.push(this, MaterialPageRoute(builder: (_) => nextScreen));
  }

  Future<dynamic> go(Widget nextScreen) async {
    return await Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => nextScreen),
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic> pushReplacement(Widget nextScreen) async {
    return await Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  void pop({dynamic result}) {
    return Navigator.of(this).pop(result);
  }
}

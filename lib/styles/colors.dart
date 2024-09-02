import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xff1fcc79);
  static const Color secondary = Color(0xffff6464);
  static const Color mainText = Color(0xff2e3e5c);
  static const Color headlineText = Color(0xff3e5481);
  static const Color secondaryText = Color(0xff9fa5c0);
  static const Color outline = Color(0xffd0dbea);
  static const Color form = Color(0xfff4f5f7);

  static final boxshadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      spreadRadius: 2,
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];
}

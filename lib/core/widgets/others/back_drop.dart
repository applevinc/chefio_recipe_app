import 'dart:ui';
import 'package:flutter/material.dart';

class DashBackDrop extends StatelessWidget {
  const DashBackDrop({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.white.withOpacity(.8),
          child: child,
        ),
      ),
    );
  }
}

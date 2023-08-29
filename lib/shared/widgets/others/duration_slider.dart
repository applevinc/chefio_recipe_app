import 'package:flutter/material.dart';

class DurationSlider extends StatelessWidget {
  const DurationSlider({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final double value;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      max: 60,
      divisions: 2,
      onChanged: onChanged,
    );
  }
}

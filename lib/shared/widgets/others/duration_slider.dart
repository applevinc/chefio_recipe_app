import 'package:flutter/material.dart';

class DurationSlider extends StatefulWidget {
  const DurationSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<DurationSlider> createState() => _DurationSliderState();
}

class _DurationSliderState extends State<DurationSlider> {
  double _currentSliderValue = 30;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 60,
      onChanged: (value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

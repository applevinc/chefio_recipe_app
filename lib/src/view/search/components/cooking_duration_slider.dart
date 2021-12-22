import 'package:flutter/material.dart';

class CookingDurationSlider extends StatefulWidget {
  const CookingDurationSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<CookingDurationSlider> createState() => _CookingDurationSliderState();
}

class _CookingDurationSliderState extends State<CookingDurationSlider> {
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

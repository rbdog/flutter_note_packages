import 'package:flutter/material.dart';

class MinimalSlider extends StatelessWidget {
  const MinimalSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  final double value;
  final double min;
  final double max;
  final int divisions;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        thumbShape: RoundSliderThumbShape(elevation: 2),
      ),
      child: Slider(
        thumbColor: Colors.white,
        activeColor: Colors.blue,
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
      ),
    );
  }
}

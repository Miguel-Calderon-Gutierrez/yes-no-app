import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 180, 180, 180);

const List<Color> _colorThemes = [
  Color.fromARGB(255, 71, 0, 143),
  Color.fromARGB(255, 0, 110, 200),
  Color.fromARGB(255, 16, 162, 0),
  Color.fromARGB(255, 0, 135, 4),
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.black,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor <= (_colorThemes.length-1),
  "Colors must be between 0 and ${_colorThemes.length}");

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}

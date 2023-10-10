import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  MaterialColor get toMaterialColor {
    return MaterialColor(
      value,
      <int, Color>{
        50: Color(value),
        100: Color(value),
        200: Color(value),
        300: Color(value),
        400: Color(value),
        500: Color(value),
        600: Color(value),
        700: Color(value),
        800: Color(value),
        900: Color(value),
      },
    );
  }
}

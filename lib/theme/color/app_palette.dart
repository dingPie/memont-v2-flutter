import 'package:flutter/material.dart';

class AppPalette {
  // primary
  static const Map<int, Color> primary = {
    50: Color.fromRGBO(247, 250, 255, 1),
    100: Color.fromRGBO(227, 237, 255, 1),
    200: Color.fromRGBO(206, 223, 255, 1),
    300: Color.fromRGBO(183, 207, 255, 1),
    400: Color.fromRGBO(151, 186, 255, 1),
    500: Color.fromRGBO(108, 158, 255, 1),
    600: Color.fromRGBO(87, 130, 255, 1),
    700: Color.fromRGBO(71, 107, 255, 1),
    800: Color.fromRGBO(59, 88, 255, 1),
    900: Color.fromRGBO(42, 88, 255, 1),
  };

  // gray
  static const Map<int, Color> gray = {
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF7F7F7),
    200: Color(0xFFF2F3F4),
    300: Color(0xFFE5E7EC),
    400: Color(0xFFD1D4DD),
    500: Color(0xFFB8BCC8),
    600: Color(0xFF8C919F),
    700: Color(0xFF757983),
    800: Color(0xFF4A4D55),
    900: Color(0xFF292A2E),
  };

  static const Color success = Color.fromARGB(255, 54, 205, 132);
  static const Color warning = Color(0xFFFF6060);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}

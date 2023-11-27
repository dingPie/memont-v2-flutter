import 'package:flutter/material.dart';
import 'package:flutter_init/theme/app_color_extension.dart';
import 'package:flutter_init/theme/app_palette.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  //
  // Light theme
  //
  static final light = ThemeData.light().copyWith(
    extensions: [
      lightAppColors,
    ],
  );
  static final lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    secondary: const Color(0xff03dac6),
    success: const Color(0xFF006DF7),
    warning: const Color(0xFFE83030),
    error: const Color(0xffb00020),
    background: Colors.white,
    gray: AppPalette.gray,
  );

  //
  // Dark theme
  // 아직 제대로 설정하지 않음.
  //
  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );
  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    secondary: const Color(0xff03dac6),
    success: const Color(0xFF006DF7),
    warning: const Color(0xFFE83030),
    error: const Color(0xffb00020),
    background: Colors.white,
    gray: AppPalette.gray,
  );
}

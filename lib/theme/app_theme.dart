import 'package:flutter/material.dart';
import 'package:flutter_init/theme/color/app_colors_extension.dart';
import 'package:flutter_init/theme/color/app_palette.dart';

import 'package:flutter_init/theme/textStyle/app_text_style_extension.dart';
import 'package:flutter_init/theme/textStyle/app_typograyphy.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  //
  // Text Theme
  //
  static const textTheme = AppTextStyleExtension(
    body1: AppTypography.body1,
    h1: AppTypography.h1,
  );

  //
  // Light theme
  //
  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    secondary: const Color(0xff03dac6),
    success: const Color(0xFF006DF7),
    warning: const Color(0xFFE83030),
    error: const Color(0xffb00020),
    background: Colors.white,
    gray: AppPalette.gray,
  );

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
      textTheme,
    ],
  );

  //
  // Dark theme
  // 아직 제대로 설정하지 않음.
  //
  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    secondary: const Color(0xff03dac6),
    success: const Color(0xFF006DF7),
    warning: const Color(0xFFE83030),
    error: const Color(0xffb00020),
    background: Colors.white,
    gray: AppPalette.gray,
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
      textTheme,
    ],
  );
}

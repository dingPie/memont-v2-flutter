import 'package:flutter/material.dart';
import 'package:memont_v2/theme/color/app_colors_extension.dart';
import 'package:memont_v2/theme/color/app_palette.dart';

import 'package:memont_v2/theme/textStyle/app_text_style_extension.dart';
import 'package:memont_v2/theme/textStyle/app_typograyphy.dart';

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
  static final textTheme = AppTextStyleExtension(
    body1: AppTypography.body1,
    h1: AppTypography.h1,
    display: {
      'lg': AppTypography.display['lg']!,
      'md': AppTypography.display['md']!,
      'sm': AppTypography.display['sm']!,
    },
    title: {
      'lg': AppTypography.title['lg']!,
      'md': AppTypography.title['md']!,
      'sm': AppTypography.title['sm']!,
    },
    heading: {
      'lg': AppTypography.heading['lg']!,
      'md': AppTypography.heading['md']!,
      'sm': AppTypography.heading['sm']!,
    },
    body: {
      'lg': AppTypography.body['lg']!,
      'md': AppTypography.body['md']!,
      'sm': AppTypography.body['sm']!,
    },
    detail: {
      'lg': AppTypography.detail['lg']!,
      'md': AppTypography.detail['md']!,
      'sm': AppTypography.detail['sm']!,
    },
  );

  //
  // Light theme
  //
  static final _lightAppColors = AppColorsExtension(
    primary: AppPalette.primary,
    secondary: const Color(0xff03dac6),
    success: AppPalette.success,
    warning: AppPalette.warning,
    background: AppPalette.gray[100]!,
    gray: AppPalette.gray,
    white: AppPalette.white,
    black: AppPalette.black,
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
    primary: AppPalette.primary,
    secondary: const Color(0xff03dac6),
    success: AppPalette.success,
    warning: AppPalette.warning,
    background: AppPalette.gray[100]!,
    gray: AppPalette.gray,
    white: AppPalette.white,
    black: AppPalette.black,
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
      textTheme,
    ],
  );
}

import 'package:flutter/material.dart';

/// P_TODO: 기존에 하던 방식은 primary.500 이런 식으로 많이 작업했지만
/// button.primary 같은 용도별 상황을 써보고싶긴 함.
///
/// 일단은 gray만 숫자로 접근하는 `Map`형태의 컬러, 나머진 일반 형태의 컬러로 작성함.
///
/// 추후 수정될 수 있음. ColorPalette와 사용을 완전히 분리시킬지 어떨지는 고민중.
///
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Map<int, Color> primary;
  final Map<int, Color> gray;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color background;
  final Color white;
  final Color black;

  AppColorsExtension({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.background,
    required this.gray,
    required this.white,
    required this.black,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Map<int, Color>? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? background,
    Map<int, Color>? gray,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      background: background ?? this.background,
      gray: gray ?? this.gray,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: {
        50: Color.lerp(primary[50], other.primary[50], t)!,
        100: Color.lerp(primary[100], other.primary[100], t)!,
        200: Color.lerp(primary[200], other.primary[200], t)!,
        300: Color.lerp(primary[300], other.primary[300], t)!,
        400: Color.lerp(primary[400], other.primary[400], t)!,
        500: Color.lerp(primary[500], other.primary[500], t)!,
        600: Color.lerp(primary[600], other.primary[600], t)!,
        700: Color.lerp(primary[700], other.primary[700], t)!,
        800: Color.lerp(primary[800], other.primary[800], t)!,
        900: Color.lerp(primary[900], other.primary[900], t)!,
      },
      gray: {
        50: Color.lerp(gray[50], other.gray[50], t)!,
        100: Color.lerp(gray[100], other.gray[100], t)!,
        200: Color.lerp(gray[200], other.gray[200], t)!,
        300: Color.lerp(gray[300], other.gray[300], t)!,
        400: Color.lerp(gray[400], other.gray[400], t)!,
        500: Color.lerp(gray[500], other.gray[500], t)!,
        600: Color.lerp(gray[600], other.gray[600], t)!,
        700: Color.lerp(gray[700], other.gray[700], t)!,
        800: Color.lerp(gray[800], other.gray[800], t)!,
        900: Color.lerp(gray[900], other.gray[900], t)!,
      },
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      background: Color.lerp(background, other.background, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}

/// Optional. If you also want to assign colors in the `ColorScheme`.
// extension ColorSchemeBuilder on AppColorsExtension {
//   ColorScheme toColorScheme(Brightness brightness) {
//     return ColorScheme(
//       brightness: brightness,
//       primary: primary,
//       secondary: secondary,
//       error: error,
//       background: background,
//     );
//   }
// }

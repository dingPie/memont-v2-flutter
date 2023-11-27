import 'package:flutter/material.dart';

/// P_TODO: 기존에 하던 방식은 primary.500 이런 식으로 많이 작업했지만
/// button.primary 같은 용도별 상황을 써보고싶긴 함.
///
/// 일단은 gray만 숫자로 접근하는 `Map`형태의 컬러, 나머진 일반 형태의 컬러로 작성함.
///
/// 추후 수정될 수 있음. ColorPalette와 사용을 완전히 분리시킬지 어떨지는 고민중.
///
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.warning,
    required this.background,
    required this.gray,
  });

  final Color primary;
  final Color secondary;
  final Color error;
  final Color success;
  final Color warning;
  final Color background;
  final Map<int, Color> gray;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? error,
    Color? success,
    Color? warning,
    Color? background,
    Map<int, Color>? gray,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      background: background ?? this.background,
      gray: gray ?? this.gray,
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
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      background: Color.lerp(background, other.background, t)!,
      gray: {
        50: Color.lerp(gray[50], other.gray[50], t)!,
        100: Color.lerp(gray[100], other.gray[100], t)!,
      },
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

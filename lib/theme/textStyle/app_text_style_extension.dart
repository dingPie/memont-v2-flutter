import 'package:flutter/material.dart';

/// `ThemeExtension` template for custom text styles.
///
/// If your goal is to only change the text color for light/dark mode, I don't see a big benefit from this extension.
/// For the default text style in the Text widget, you can set `textTheme.bodyMedium` in `ThemeData` (example: lib/app_theme.dart).
/// And to set text color for specific widgets, you can use `style: TextStyle(color: Theme.of(context).appColors.error)` or
/// `style: AppTypography.h1.copyWith(color: context.theme.appColors.error)`.
class AppTextStyleExtension extends ThemeExtension<AppTextStyleExtension> {
  const AppTextStyleExtension({
    required this.h1,
    required this.body1,
  });

  final TextStyle h1;
  final TextStyle body1;

  @override
  ThemeExtension<AppTextStyleExtension> copyWith({
    TextStyle? h1,
    TextStyle? body1,
  }) {
    return AppTextStyleExtension(
      h1: h1 ?? this.h1,
      body1: body1 ?? this.body1,
    );
  }

  @override
  ThemeExtension<AppTextStyleExtension> lerp(
    covariant ThemeExtension<AppTextStyleExtension>? other,
    double t,
  ) {
    if (other is! AppTextStyleExtension) {
      return this;
    }

    return AppTextStyleExtension(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
    );
  }
}

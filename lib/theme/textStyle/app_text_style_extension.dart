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
    required this.display,
    required this.title,
    required this.heading,
    required this.body,
    required this.detail,
  });

  final TextStyle h1;
  final TextStyle body1;
  final Map<String, TextStyle> display;
  final Map<String, TextStyle> title;
  final Map<String, TextStyle> heading;
  final Map<String, TextStyle> body;
  final Map<String, TextStyle> detail;

  @override
  ThemeExtension<AppTextStyleExtension> copyWith({
    TextStyle? h1,
    TextStyle? body1,
  }) {
    return AppTextStyleExtension(
      h1: h1 ?? this.h1,
      body1: body1 ?? this.body1,
      display: display ?? this.display,
      title: title ?? this.title,
      heading: heading ?? this.heading,
      body: body ?? this.body,
      detail: detail ?? this.detail,
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
      display: {
        'lg': TextStyle.lerp(display['lg'], other.display['lg'], t)!,
        'md': TextStyle.lerp(display['md'], other.display['md'], t)!,
        'sm': TextStyle.lerp(display['sm'], other.display['sm'], t)!,
      },
      title: {
        'lg': TextStyle.lerp(title['lg'], other.title['lg'], t)!,
        'md': TextStyle.lerp(title['md'], other.title['md'], t)!,
        'sm': TextStyle.lerp(title['sm'], other.title['sm'], t)!,
      },
      heading: {
        'lg': TextStyle.lerp(heading['lg'], other.heading['lg'], t)!,
        'md': TextStyle.lerp(heading['md'], other.heading['md'], t)!,
        'sm': TextStyle.lerp(heading['sm'], other.heading['sm'], t)!,
      },
      body: {
        'lg': TextStyle.lerp(body['lg'], other.body['lg'], t)!,
        'md': TextStyle.lerp(body['md'], other.body['md'], t)!,
        'sm': TextStyle.lerp(body['sm'], other.body['sm'], t)!,
      },
      detail: {
        'lg': TextStyle.lerp(detail['lg'], other.detail['lg'], t)!,
        'md': TextStyle.lerp(detail['md'], other.detail['md'], t)!,
        'sm': TextStyle.lerp(detail['sm'], other.detail['sm'], t)!,
      },
    );
  }
}

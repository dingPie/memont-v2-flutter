import 'package:flutter/material.dart';
import 'package:flutter_init/theme/app_color_extension.dart';
import 'package:flutter_init/theme/app_theme.dart';

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme.lightAppColors;
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  AppColorsExtension get appColors =>
      theme.extension<AppColorsExtension>() ?? AppTheme.lightAppColors;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

// P_TODO: 이건 필요한지 확인해봐야 함.
// extension MaterialStateHelpers on Iterable<MaterialState> {
//   bool get isHovered => contains(MaterialState.hovered);
//   bool get isFocused => contains(MaterialState.focused);
//   bool get isPressed => contains(MaterialState.pressed);
//   bool get isDragged => contains(MaterialState.dragged);
//   bool get isSelected => contains(MaterialState.selected);
//   bool get isScrolledUnder => contains(MaterialState.scrolledUnder);
//   bool get isDisabled => contains(MaterialState.disabled);
//   bool get isError => contains(MaterialState.error);
// }

// extension IterableExtensions on Iterable {
//   bool containsAny(Iterable<Object?> other) => other.any((e) => contains(e));
// }

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Returns the [ThemeData] of the current context.
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] of the current context.
  TextTheme get textTheme => theme.textTheme;

  /// Returns the [ColorScheme] of the current context.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns the [MediaQuery] size of the current context.
  Size get size => MediaQuery.sizeOf(this);

  /// Returns screen width of the current context.
  double get screenWidth => size.width;
  /// Returns screen height of the current context.
  double get screenHeight => size.height;
}

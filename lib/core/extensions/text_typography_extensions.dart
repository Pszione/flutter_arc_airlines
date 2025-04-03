import 'package:flutter/material.dart';

// TODO: move to theme
extension TextTypographyExtensions on TextStyle {
  TextStyle weightBold() => copyWith(fontWeight: FontWeight.bold);
  TextStyle weightSemiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle weightDefault() => copyWith(fontWeight: FontWeight.w500);
  TextStyle weightThin() => copyWith(fontWeight: FontWeight.w400);
  TextStyle weightThinner() => copyWith(fontWeight: FontWeight.w300);

  TextStyle toColor(Color? color) => copyWith(color: color);
}

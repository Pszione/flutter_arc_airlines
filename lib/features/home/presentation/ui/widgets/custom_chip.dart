import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final EdgeInsetsGeometry? padding;
  final double? paddingMultiplier;

  const CustomChip({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.padding,
    this.paddingMultiplier,
  }) : assert(
         padding == null || paddingMultiplier == null,
         'You can user or padding or paddingMultiplier, but not both',
       ),
       assert(
         paddingMultiplier == null || paddingMultiplier > 0,
         'paddingMultiplier must be a positive number',
       );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const StadiumBorder(),
      child: Padding(
        padding:
            padding ??
            EdgeInsets.symmetric(
              vertical: 4.0 * (paddingMultiplier ?? 1),
              horizontal: 8.0 * (paddingMultiplier ?? 1),
            ),
        child: Text(text, style: TextStyle(color: textColor).weightSemiBold()),
      ),
    );
  }
}

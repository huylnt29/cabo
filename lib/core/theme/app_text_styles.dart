import 'package:cabo_customer/core/extensions/font_size_extensions.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._internal();

  static TextStyle heading1(Color color) => TextStyle(
        color: color,
        fontSize: 24.sf,
        fontWeight: FontWeight.bold,
        height: 2,
      );

  static TextStyle heading2(Color color) => TextStyle(
        color: color,
        fontSize: 20.sf,
        fontWeight: FontWeight.bold,
        height: 2,
      );

  static TextStyle heading3(Color color) => TextStyle(
        color: color,
        fontSize: 18.sf,
        fontWeight: FontWeight.bold,
        height: 2,
      );

  static TextStyle text(Color color, {bool bold = false}) => TextStyle(
        color: color,
        fontSize: 13.sf,
        fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
        height: 2,
      );

  static TextStyle smallText(Color color) => TextStyle(
        color: color,
        fontSize: 11.sf,
        height: 2,
      );

  static TextStyle custom({
    Color? color,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        color: color ?? AppColors.secondaryColor,
        fontSize: fontSize ?? 13.sf,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
}

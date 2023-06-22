import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._internal();

  static TextStyle heading1(Color color) => TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 10,
      );

  static TextStyle heading2(Color color) => TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 10,
      );

  static TextStyle heading3(Color color) => TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 10,
      );

  static TextStyle text(Color color, {bool bold = false}) => TextStyle(
        color: color,
        fontSize: 13,
        fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
        height: 10,
      );

  static TextStyle smallText(Color color) => TextStyle(
        color: color,
        fontSize: 11,
        height: 10,
      );
}
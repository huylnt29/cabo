import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const greenBackgroundColor = Color.fromARGB(255, 162, 202, 184);

  AppColors._internall();

  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Color(0xFF403949);
  static const Color accentColor = Color(0xFFffc6bc);
  static const Color textColor = Color.fromARGB(255, 41, 40, 40);
  static const Color blueBackgroundColor = Color(0xFFD3F5FE);
  static const Color purpleBackgroundColor = Color(0xFFEEE1FF);
  static const Color yellowBackgroundColor = Color(0xFFE6F69C);
  static const Color orangeBackgroundColor = Color(0xFFFEE0C4);

  static Color getRandom() {
    List<Color> colors = [
      blueBackgroundColor,
      purpleBackgroundColor,
      yellowBackgroundColor,
      orangeBackgroundColor
    ];
    return colors.elementAt(Random().nextInt(colors.length));
  }
}

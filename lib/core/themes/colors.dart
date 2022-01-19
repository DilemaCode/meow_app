import 'package:flutter/material.dart';

class AppColors {
  static Color whiteText = Color(0xffffffff);
  static Color blackText = Color(0xff000000);
  static Color greyText = Colors.grey;
  static Color backgroundDark = Color(0xff212121);
  static Color backgroundLight = Color(0xffffffff);
  static Color primaryColor = Color(0xff9c51e2);

  static List<Color> tagsColors = [
    Color(0xffe95756),
    Color(0xfff29d4f),
    Color(0xff2eb063),
    Color(0xff2b83f0),
    Color(0xff56cdf2),
    Color(0xff9c51e2),
  ];

  static const shimmerGradient = LinearGradient(colors: [
    Color(0xFFaaaaaa),
    Color(0xFFF4F4F4),
    Color(0xFFaaaaaa),
  ]);
  static const shimmerGradientDark = LinearGradient(colors: [
    Color(0xFF363738),
    Color(0xFF202123),
    Color(0xFF363738),
  ]);
}

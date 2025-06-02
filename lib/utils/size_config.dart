import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._internal();

  ScreenSize._internal();

  factory ScreenSize() => _instance;

  double? screenWidth;
  double? screenHeight;

  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }

  double getWidthPercentage(double percentage) {
    if (screenWidth == null) throw Exception('ابتدا init را صدا بزنید');
    return screenWidth! * (percentage / 100);
  }

  double getHeightPercentage(double percentage) {
    if (screenHeight == null) throw Exception('ابتدا init را صدا بزنید');
    return screenHeight! * (percentage / 100);
  }

  double getBorderRadius(double sizeFactor) {
    if (screenWidth == null) throw Exception('ابتدا init را صدا بزنید');
    return screenWidth! * (sizeFactor / 100);
  }

  double getFontSize(double sizeFactor) {
    if (screenWidth == null) throw Exception('ابتدا init را صدا بزنید');
    return screenWidth! * (sizeFactor / 100);
  }
}
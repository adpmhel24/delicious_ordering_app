import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static Orientation? orientation;

  static double get defaultPadding => defaultSize * 1.5;

  getDefaultFontSized(dynamic value) {
    if (screenWidth <= 650) {
      return ((value / 650) * screenHeight) < 10.0
          ? 10.0
          : (value / 650) * screenHeight;
    } else if (screenWidth > 650 && screenWidth < 1100) {
      return ((value / 1100) * screenHeight) < 10.0
          ? 10.0
          : (value / 1100) * screenHeight;
    } else if (screenWidth >= 1100) {
      return ((value / 1500) * screenHeight) < 10.0
          ? 10.0
          : (value / 1500) * screenHeight;
    }
  }

  void init(BoxConstraints constraints, Orientation orientation) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    // Desktop Width Size >=1100
    // Mobile Width Size <=650
    // Table Width Size >650 & <1100

    if (screenWidth <= 650) {
      defaultSize = screenHeight * 10 / 750;
    } else if (screenWidth > 650 && screenWidth < 1100) {
      defaultSize = screenHeight * 10 / 800;
    } else if (screenWidth >= 1100) {
      defaultSize = screenHeight * 10 / 900;
    }
  }

  ///Singleton factory
  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._internal();
}

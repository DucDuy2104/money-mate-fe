import 'package:flutter/material.dart';

class AppDimens {
  static const double iconSize = 24.0;
  static const double iconSizeSmall = 16.0;
  static const double avatar = 48.0;

  static const double padding = 16.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 24.0;

  static const double borderRadius = 12.0;
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 16.0;
  static const double borderRadiusLarge = 24.0;

  static const Widget space = SizedBox(height: padding, width: padding);
  static const Widget spaceSmall = SizedBox(height: paddingSmall, width: paddingSmall);
  static const Widget spaceMedium = SizedBox(height: paddingMedium, width: paddingMedium);
  static const Widget spaceLarge = SizedBox(height: paddingLarge, width: paddingLarge);
  static const Widget divider = SizedBox(height: paddingSmall / 2, width: paddingSmall);
}
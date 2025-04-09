import 'package:flutter/material.dart';

class AppDimens {
  // Icon sizes
  static const double iconSize = 24.0;
  static const double iconSizeSmall = 16.0;

  // Avatar
  static const double avatarSize = 48.0;

  // Padding (spacing)
  static const double paddingXs = 4.0;   // Extra Small
  static const double paddingSm = 8.0;   // Small
  static const double paddingMd = 16.0;  // Medium (default)
  static const double paddingLg = 24.0;  // Large

  // Border Radius
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;

  // Spacing widgets
  static const Widget spaceXs = SizedBox(height: paddingXs, width: paddingXs);
  static const Widget spaceSm = SizedBox(height: paddingSm, width: paddingSm);
  static const Widget spaceMd = SizedBox(height: paddingMd, width: paddingMd);
  static const Widget spaceLg = SizedBox(height: paddingLg, width: paddingLg);

  // Divider spacing
  static const Widget divider = SizedBox(height: paddingSm / 2, width: paddingSm);
}

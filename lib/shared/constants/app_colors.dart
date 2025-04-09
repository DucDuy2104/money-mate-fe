import 'package:flutter/material.dart';

abstract class AppColors {
  static AppColors colorsData(BuildContext context) {
    final AppColors appColors = Theme.of(context).brightness == Brightness.dark
        ? DarkThemeColors()
        : LightThemeColors();
    return appColors;
  }

  Color get seccondColor;
  Color get dialogColor;
  Color get contrastColor;
  List<Color> get gradientColors;
  Color get subTextColor;
  Color get thirdColor;

  static const primaryColor = Color(0xFF66B2FF);
  static const upColor = Colors.green;
  static const downColor = Colors.red;
  static const subText = Color(0xFF888888);

  // Light mode colors
  static const background = Color(0xFFFFFFFF);
  static const seccondColorLight = Color(0xFFE2E8F0);

  // Dark mode colors
  static const darkBackground = Color(0xFF121212);
  static const seccondColorDark = Color(0xFF2D2D3A);

  static var darkCardColor = Colors.grey.shade900;
}

class DarkThemeColors extends AppColors {
  @override
  Color get seccondColor => const Color(0xFF2D2D3A);

  @override
  Color get dialogColor => const Color(0xFF1E1E2E);

  @override
  Color get contrastColor => Colors.white;

  @override
  List<Color> get gradientColors => [
        const Color(0xFF1E1E1E),
        const Color(0xFF343A40),
        const Color(0xFF495057)
      ];

  @override
  Color get subTextColor => const Color(0xFFB0B3B8);
  
  @override
  Color get thirdColor => const Color(0xFF2A2A2A);
}

class LightThemeColors extends AppColors {
  @override
  Color get seccondColor => const Color(0xFFE2E8F0);

  @override
  Color get dialogColor => const Color(0xFFF5F7FA);

  @override
  Color get contrastColor => Colors.black;

  @override
  List<Color> get gradientColors => [
        const Color(0xFFCCD6DD),
        const Color(0xFFB0BEC5),
        const Color(0xFF90A4AE),
      ];

  @override
  Color get subTextColor => const Color(0xFF6C757D);
  
  @override
  Color get thirdColor => Colors.white;
}

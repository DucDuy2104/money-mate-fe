import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

const _primaryColor = AppColors.primaryColor;
const _secondaryColor = Color(0xFF4CAF50);
const _darkBackgroundColor = Color(0xFF121212);
const _lightTextColor = Color(0xFF212121);
const _darkTextColor = Colors.white;

const double _defaultBorderRadius = AppDimens.borderRadiusSmall;

final _materialColorPrimary = MaterialColor(
  _primaryColor.value,
  <int, Color>{
    50: _primaryColor.withOpacity(.1),
    100: _primaryColor.withOpacity(.2),
    200: _primaryColor.withOpacity(.3),
    300: _primaryColor.withOpacity(.4),
    400: _primaryColor.withOpacity(.5),
    500: _primaryColor.withOpacity(.6),
    600: _primaryColor.withOpacity(.7),
    700: _primaryColor.withOpacity(.8),
    800: _primaryColor.withOpacity(.9),
    900: _primaryColor,
  },
);

class AppThemeData {
  static ThemeData lightTheme(BuildContext context) {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: _materialColorPrimary,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),
      iconTheme: const IconThemeData(
        color: _lightTextColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: _primaryColor),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: _lightTextColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        centerTitle: true,
      ),
      textTheme: baseTextTheme
          .copyWith(
            displayLarge: baseTextTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
            displayMedium: baseTextTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            displaySmall: baseTextTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            headlineMedium: baseTextTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            headlineSmall: baseTextTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            titleLarge: baseTextTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            bodyLarge: baseTextTheme.bodyLarge?.copyWith(
              fontSize: 16,
            ),
            bodyMedium: baseTextTheme.bodyMedium?.copyWith(
              fontSize: 14,
            ),
            bodySmall: baseTextTheme.bodySmall?.copyWith(
              fontSize: 12,
            ),
            labelSmall: baseTextTheme.labelSmall?.copyWith(
              fontSize: 10,
            ),
          )
          .apply(
            bodyColor: _lightTextColor,
            displayColor: _lightTextColor,
          ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
        ),
        buttonColor: _primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.padding,
          horizontal: AppDimens.padding,
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.padding,
            horizontal: AppDimens.paddingLarge,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_defaultBorderRadius),
          ),
          elevation: 1,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding,
          vertical: AppDimens.padding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
          borderSide: BorderSide(color: _primaryColor.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
          borderSide: const BorderSide(color: _primaryColor, width: 1.5),
        ),
        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
        errorStyle: const TextStyle(height: 0.8),
        isDense: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: _primaryColor,
        unselectedItemColor: Colors.grey.shade600,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: AppDimens.paddingSmall,
          horizontal: AppDimens.paddingSmall,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.padding,
          vertical: AppDimens.paddingSmall,
        ),
        minLeadingWidth: 24,
        iconColor: _lightTextColor,
        textColor: _lightTextColor,
      ),
      dividerTheme: const DividerThemeData(
        space: AppDimens.padding,
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingSmall / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: _materialColorPrimary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: _primaryColor,
        secondary: _secondaryColor,
        background: _darkBackgroundColor,
        surface: Color(0xFF1E1E1E),
      ),
      iconTheme: const IconThemeData(
        color: _darkTextColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _darkBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: _darkTextColor),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: _darkTextColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        centerTitle: true,
      ),
      textTheme: baseTextTheme
          .copyWith(
            displayLarge: baseTextTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
            displayMedium: baseTextTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            displaySmall: baseTextTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            headlineMedium: baseTextTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            headlineSmall: baseTextTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            titleLarge: baseTextTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            bodyLarge: baseTextTheme.bodyLarge?.copyWith(
              fontSize: 16,
            ),
            bodyMedium: baseTextTheme.bodyMedium?.copyWith(
              fontSize: 14,
            ),
            bodySmall: baseTextTheme.bodySmall?.copyWith(
              fontSize: 12,
            ),
            labelSmall: baseTextTheme.labelSmall?.copyWith(
              fontSize: 10,
            ),
          )
          .apply(
            bodyColor: _darkTextColor,
            displayColor: _darkTextColor,
          ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
        ),
        buttonColor: _primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.padding,
          horizontal: AppDimens.paddingLarge,
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.padding,
            horizontal: AppDimens.paddingLarge,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_defaultBorderRadius),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
          elevation: 1,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding,
          vertical: AppDimens.padding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
          borderSide: BorderSide(color: _primaryColor.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
          borderSide: BorderSide(color: Colors.grey.shade800, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
          borderSide: const BorderSide(color: _primaryColor, width: 1.5),
        ),
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        errorStyle: const TextStyle(height: 0.8),
        isDense: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: _primaryColor,
        unselectedItemColor: Colors.grey.shade500,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF2C2C2C),
        surfaceTintColor: const Color(0xFF2C2C2C),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: AppDimens.paddingSmall,
          horizontal: AppDimens.paddingSmall,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.padding,
          vertical: AppDimens.paddingSmall,
        ),
        minLeadingWidth: 24,
        iconColor: _darkTextColor,
        textColor: _darkTextColor,
      ),
      dividerTheme: DividerThemeData(
        space: AppDimens.padding,
        thickness: 1,
        color: Colors.grey.shade800,
      ),
      chipTheme: ChipThemeData(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingSmall / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultBorderRadius),
        ),
      ),
    );
  }
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
  Color get primaryColor => Theme.of(this).primaryColor;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

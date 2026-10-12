import 'package:flutter/material.dart';

class AppTheme {
  static const Color salamanderGreen = Color(0xFF2E6339);
  static const Color darkGreen = Color(0xFF16301C);
  static const Color flameOrange = Color(0xFFFF8A00);
  static const Color flameRed = Color(0xFFB1121F);
  static const Color gold = Color(0xFFD9A441);
  static const Color background = Color(0xFF0A130D);
  static const Color darkSurface = Color(0xFF122417);
  static const Color darkAppBar = Color(0xFF0E1A12);
  static const Color border = Color(0xFF24402B);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: salamanderGreen,
      colorScheme: const ColorScheme.dark(
        primary: salamanderGreen,
        secondary: flameOrange,
        tertiary: gold,
        surface: darkSurface,
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: darkAppBar,
        foregroundColor: gold,
        centerTitle: false,
        elevation: 0,
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: darkSurface,
        selectedColor: salamanderGreen,
      ),
    );
  }
}

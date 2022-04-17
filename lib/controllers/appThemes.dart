import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColourDark,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColourLight,
    colorScheme: const ColorScheme.light(),
  );
}
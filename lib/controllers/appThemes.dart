import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppThemes {
  // ignore: prefer_const_constructors
  static final TextTheme textTheme = TextTheme(
    // headline1: TextStyle(),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColourDark,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: secondaryColourDark,
      secondary: secondaryColourDark,
    ),
    iconTheme: const IconThemeData(color: primaryColourDark,),
    textTheme: textTheme.apply(
      bodyColor: secondaryColourDark,
      displayColor: primaryColourDark,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColourLight,
    colorScheme: const ColorScheme.light().copyWith(
      primary: secondaryColourLight,
      secondary: secondaryColourLight,
    ),
    iconTheme: const IconThemeData(color: primaryColourLight,),
    textTheme: textTheme.apply(
      bodyColor: primaryColourLight,
      displayColor: primaryColourLight,
    ),
  );
}
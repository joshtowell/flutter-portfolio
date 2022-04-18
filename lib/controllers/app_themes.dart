import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppThemes {

  /// FontWeight.normal (w400)
  /// FontWeight.normal (w700)
  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 68.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    headline2: GoogleFonts.sora(
      textStyle: const TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle1: GoogleFonts.sora(
      textStyle: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle2: GoogleFonts.sora(
      textStyle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    bodyText1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
    ),
    button: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColourDark,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: secondaryColourDark,
      secondary: secondaryColourDark,
    ),
    iconTheme: const IconThemeData(color: primaryColourDark,),
    textTheme: textTheme.apply(
      /// BodyColour = Headlines
      bodyColor: primaryColourDark,
      /// DisplayColour = Subtitles, BodyText
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
      /// BodyColour = Headlines
      bodyColor: primaryColourLight,
      /// DisplayColour = Subtitles, BodyText
      displayColor: primaryColourLight,
    ),
  );
}
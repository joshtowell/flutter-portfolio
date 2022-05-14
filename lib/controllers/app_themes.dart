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
    scaffoldBackgroundColor: sixtyColourDark,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: tenColourDark,
      secondary: tenColourDark,
    ),
    iconTheme: const IconThemeData(color: thirtyColourDark,),
    textTheme: textTheme.apply(
      /// BodyColour = Headlines
      bodyColor: thirtyColourDark,
      /// DisplayColour = Subtitles, BodyText
      displayColor: thirtyColourDark,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: sixtyColourLight,
    colorScheme: const ColorScheme.light().copyWith(
      primary: tenColourLight,
      secondary: tenColourLight,
    ),
    iconTheme: const IconThemeData(color: thirtyColourLight,),
    textTheme: textTheme.apply(
      /// BodyColour = Headlines
      bodyColor: thirtyColourLight,
      /// DisplayColour = Subtitles, BodyText
      displayColor: thirtyColourLight,
    ),
  );
}
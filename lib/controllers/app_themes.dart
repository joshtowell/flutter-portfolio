import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:flutter_portfolio/controllers/settings_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void getExisting() {
    switch (SettingsController.getColourThemeMode()) {
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      case "light":
        themeMode = ThemeMode.light;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
    // notifyListeners();   // TODO: Look into init on constructor - conflicting setState()
  }

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    SettingsController.setColourThemeMode(themeMode == ThemeMode.light ? "light" : "dark");
    notifyListeners();
  }
}

class AppThemes {

  /// FontWeight.normal (w400)
  /// FontWeight.normal (w700)
  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 36.0
        /// Desktop: 68.0
        fontSize: 36.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    headline2: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 26.0
        /// Desktop: 36.0
        fontSize: 26.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 18.0
        /// Desktop: 24.0
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
    subtitle2: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 18.0
        /// Desktop: 24.0
        fontSize: 18.0,
        fontWeight: FontWeight.w300,
      ),
    ),
    bodyText1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 16.0
        /// Desktop: 16.0
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
    ),
    bodyText2: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 14.0
        /// Desktop: 16.0
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
      ),
    ),
    button: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        /// Mobile: 16.0
        /// Desktop: 16.0
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
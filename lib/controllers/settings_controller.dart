import 'package:shared_preferences/shared_preferences.dart';

class SettingsController {
  static late SharedPreferences _settingsController;

  /// Init key-values (SharedPreferences)
  static const String _colourThemeMode = "dark";

  /// Init key-values (Session)
  // static String _sampleKeySession = "sampleValue";

  /// Load data values from local storage
  static Future init() async {
    _settingsController = await SharedPreferences.getInstance();
  }

  /// Getters and setters for key-values (SharedPreferences)
  static Future setColourThemeMode(String sampleValue) async =>
      await _settingsController.setString(_colourThemeMode, sampleValue);

  static String? getColourThemeMode() =>
      _settingsController.getString(_colourThemeMode);

  /// Getters and setters for key-values (Session)
  /*static setSampleKeySession(String sampleValue) =>
        _sampleKeySession = sampleValue;*/
}
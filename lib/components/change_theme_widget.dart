import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/app_themes.dart';

class ChangeThemeWidget extends StatelessWidget {
  final bool disableTap;

  const ChangeThemeWidget({
    this.disableTap = false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      child: Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
      onTap: !disableTap
        ? () {
          final provider = Provider.of<ThemeProvider>(context, listen: false,);
          provider.toggleTheme();
        }
        : null,
    );
  }
}

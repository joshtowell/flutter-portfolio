import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/appThemes.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      child: Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
      onTap: () {
        final provider = Provider.of<ThemeProvider>(context, listen: false,);
        provider.toggleTheme();
      },
    );
  }
}

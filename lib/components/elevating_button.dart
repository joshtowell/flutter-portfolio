import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';

class ElevatingButton extends StatelessWidget {
  final Widget child;
  final double? padding;

  const ElevatingButton({
    required this.child,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(padding ?? defaultPadding,),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? backgroundColour0Dark : backgroundColour0Light,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: (themeProvider.isDarkMode ? blackColour : backgroundColour3Dark).withOpacity(0.25),
            offset: const Offset(0.0, 8.0,),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: child,
    );
  }
}

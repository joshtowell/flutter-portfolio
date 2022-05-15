import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';

class ElevatingButton extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? colour;
  final bool hasShadow;
  final Function()? tapAction;

  const ElevatingButton({
    required this.child,
    this.padding,
    this.colour,
    this.hasShadow = true,
    this.tapAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      child: Container(
        padding: padding ?? const EdgeInsets.all(defaultPadding,),
        decoration: BoxDecoration(
          color: colour ?? (themeProvider.isDarkMode ? backgroundColour1Dark : backgroundColour0Light),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: hasShadow ? [
            BoxShadow(
              color: (themeProvider.isDarkMode ? blackColour : backgroundColour3Dark).withOpacity(0.25),
              offset: const Offset(0.0, 8.0,),
              blurRadius: 12.0,
            ),
          ] : [],
        ),
        child: child,
      ),
      onTap: tapAction,
    );
  }
}

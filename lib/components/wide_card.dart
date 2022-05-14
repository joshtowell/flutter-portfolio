import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';

class WideCard extends StatelessWidget {
  final Widget child;

  const WideCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding,),
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? backgroundColour1Dark : backgroundColour1Light,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}

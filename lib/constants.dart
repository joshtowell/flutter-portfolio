import 'package:flutter/material.dart';

import 'controllers/app_routes.dart';

/// # COLOURS

const Color whiteColour = Color(0xFFFFFFFF);
const Color blackColour = Color(0xFF000000);

/// Dark colours
const Color primaryColourDark = Color(0xFFF5F5F5);
const Color secondaryColourDark = Color(0xFF5050D4);
const Color backgroundColourDark = Color(0xFF202022);

/// Light colours
const Color primaryColourLight = Color(0xFF202022);
const Color secondaryColourLight = Color(0xFF2a2abf);
const Color backgroundColourLight = Color(0xFFF5F5F5);

/// For dark mode reduce saturation of light mode colour by -20%

/// For hierarchy, use lighter colours in front and darker colours in back
/// Tip: lowest level is 0-10 brightness, every layer above is +10 brightness
/// Traditionally 3 layers in total is enough
/// Use hints of primary colour in hierarchy colours

/// # DIMENSIONS
const double defaultPadding = 16.0;

/// Icon sizes recommended:
/// - Mobile 44-48 pixels
/// - Desktop 32 pixels

/// # STYLE SHORTCUTS
TextStyle? headline1 (BuildContext context) => Theme.of(context).textTheme.headline1;
TextStyle? headline2 (BuildContext context) => Theme.of(context).textTheme.headline2;
TextStyle? subtitle1 (BuildContext context) => Theme.of(context).textTheme.subtitle1;
TextStyle? subtitle2 (BuildContext context) => Theme.of(context).textTheme.subtitle2;
TextStyle? bodyText1 (BuildContext context) => Theme.of(context).textTheme.bodyText1;
TextStyle? button (context) => Theme.of(context).textTheme.button;

/// Button shadows should use same colour as button
/// Button shadow not too intense, but always used (never 100% flat)
/// Shadow directions should all be the same
/// Don't add shadows on all elements (mainly cards and buttons)

/// Use filled icons throughout this app

/// As font size decreases, line height should increase (fontSize - lineHeight = greater than previous number)

/// # MINI WIDGETS
const Widget shoebox = SizedBox(height: defaultPadding,);
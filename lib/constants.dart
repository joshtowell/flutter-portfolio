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

/// # DIMENSIONS
const double defaultPadding = 16.0;

/// # STYLE SHORTCUTS
TextStyle? headline1 (BuildContext context) => Theme.of(context).textTheme.headline1;
TextStyle? headline2 (BuildContext context) => Theme.of(context).textTheme.headline2;
TextStyle? subtitle1 (BuildContext context) => Theme.of(context).textTheme.subtitle1;
TextStyle? subtitle2 (BuildContext context) => Theme.of(context).textTheme.subtitle2;
TextStyle? bodyText1 (BuildContext context) => Theme.of(context).textTheme.bodyText1;
TextStyle? button (context) => Theme.of(context).textTheme.button;

/// # MINI WIDGETS
const Widget shoebox = SizedBox(height: defaultPadding,);
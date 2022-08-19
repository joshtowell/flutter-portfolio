import 'package:flutter/material.dart';

import 'controllers/responsive.dart';

/// # VALUES

const String contactEmail = "hello@joshuatowell.com";


/// # COLOURS

const Color whiteColour = Color(0xFFFFFFFF);
const Color blackColour = Color(0xFF000000);

const Color purpleHighlightColour = Color(0xFF4444BB);
const Color pinkHighlightColour = Color(0xFFDF56DA);

const Color linkedInColour = Color(0xFF0A66C2);
const Color githubColour = Color(0xFF0D2636);

const LinearGradient purpleHighlightGradient = LinearGradient(colors: [pinkHighlightColour, Color(0xFF5050D4),],);
const LinearGradient greyHighlightGradient = LinearGradient(colors: [backgroundColour0Light, backgroundColour0Dark,],);

/// For dark mode reduce saturation of light mode colour by -20%

/// For hierarchy, use lighter colours in front and darker colours in back
/// Tip: lowest level is 0-10 brightness, every layer above is +10 brightness
/// Traditionally 3 layers in total is enough
/// Use hints of primary colour in hierarchy colours

/// Dark colours
const Color backgroundColour0Dark = Color(0xFF202022);
const Color backgroundColour1Dark = Color(0xFF333336);
const Color backgroundColour2Dark = Color(0xFF49494E);
const Color backgroundColour3Dark = Color(0xFF5C5C63);

const Color sixtyColourDark = backgroundColour0Dark;
const Color thirtyColourDark = backgroundColour0Light;
const Color tenColourDark = purpleHighlightColour;

/// Light colours
const Color backgroundColour0Light = Color(0xFFF5F5F5);
const Color backgroundColour1Light = Color(0xFFE8E8F3);
const Color backgroundColour2Light = Color(0xFFDDDDEF);
const Color backgroundColour3Light = Color(0xFFB0B0E0);

const Color sixtyColourLight = backgroundColour0Light;
const Color thirtyColourLight = backgroundColour0Dark;
const Color tenColourLight = purpleHighlightColour;


/// # DIMENSIONS

const double defaultPadding = 16.0;

/// Icon sizes recommended:
/// - Mobile 44-48 pixels
/// - Desktop 32 pixels

/// # STYLE SHORTCUTS
TextStyle? headline1 (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.headline1?.copyWith(fontSize: 68.0,) : Theme.of(context).textTheme.headline1;
TextStyle? headline2 (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.headline2?.copyWith(fontSize: 32.0,) : Theme.of(context).textTheme.headline2;
TextStyle? subtitle1 (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 24.0,) : Theme.of(context).textTheme.subtitle1;
TextStyle? subtitle2 (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 24.0,) : Theme.of(context).textTheme.subtitle2;
TextStyle? bodyText1 (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0,) : Theme.of(context).textTheme.bodyText1;
TextStyle? bodyText2 (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16.0,) : Theme.of(context).textTheme.bodyText2;
TextStyle? button (BuildContext context) => Responsive.isDesktop(context) ? Theme.of(context).textTheme.button?.copyWith(fontSize: 16.0,) : Theme.of(context).textTheme.button;

/// Button shadows should use same colour as button
/// Button shadow not too intense, but always used (never 100% flat)
/// Shadow directions should all be the same
/// Don't add shadows on all elements (mainly cards and buttons)

/// Use filled icons throughout this app

/// As font size decreases, line height should increase (fontSize - lineHeight = greater than previous number)

/// # MINI WIDGETS
const Widget shoebox = SizedBox(height: defaultPadding, width: defaultPadding,);

/// # ANIMATIONS
final slideTween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero,).chain(CurveTween(curve: Curves.easeInOutQuart));

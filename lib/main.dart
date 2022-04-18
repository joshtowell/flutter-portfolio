import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:provider/provider.dart';

import 'controllers/appRoutes.dart';
import 'controllers/appThemes.dart';
import 'views/landingPage.dart';
import 'views/projectsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  String getInitialRoute() => AppRoutes.landing;

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landing:
        return buildRoute(const LandingPage(), settings: settings,);
      case AppRoutes.projects:
        return buildRoute(const ProjectsPage(), settings: settings,);
      default:
        return null;
    }
  }

  MaterialPageRoute buildRoute(Widget child, {RouteSettings? settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Joshua Towell Portfolio',
          themeMode: themeProvider.themeMode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          initialRoute: getInitialRoute(),
          onGenerateRoute: (route) => getRoute(route),
        );
      }
    );
  }
}
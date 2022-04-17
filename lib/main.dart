import 'package:flutter/material.dart';

import 'AppRoutes.dart';
import 'loginArguments.dart';
import 'views/landingPage.dart';
import 'views/pageThree.dart';
import 'views/pageTwo.dart';

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
      case AppRoutes.pageTwo:
        return buildRoute(const PageTwo(), settings: settings,);
      case AppRoutes.pageThree:
        final LoginArguments args = settings.arguments as LoginArguments;
        return buildRoute(PageThree(arguments: args,), settings: settings,);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joshua Towell Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: getInitialRoute(),
      onGenerateRoute: (route) => getRoute(route),
    );
  }
}
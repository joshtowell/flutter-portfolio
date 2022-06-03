import 'package:flutter/material.dart';
import 'package:flutter_portfolio/controllers/work_personal_controller.dart';
import 'package:provider/provider.dart';

import 'controllers/app_routes.dart';
import 'controllers/app_themes.dart';
import 'controllers/settings_controller.dart';
import 'views/landing_page.dart';
import 'views/projects_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations(); // TODO: Explore orientation compatibility
  await SettingsController.init();
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
    return MultiProvider(
      /// Allow multiple providers to be created
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<WorkPersonalProvider>(create: (_) => WorkPersonalProvider()),
      ],
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
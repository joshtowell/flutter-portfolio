// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';

import '../controllers/app_routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLightMode = false;

  Widget fontsTest() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Headline 1", style: Theme.of(context).textTheme.headline1,),
        SizedBox(height: 20.0,),
        Text("Headline 2", style: Theme.of(context).textTheme.headline2,),
        SizedBox(height: 20.0,),
        Text("Subtitle 1", style: Theme.of(context).textTheme.subtitle1,),
        SizedBox(height: 20.0,),
        Text("Subtitle 2", style: Theme.of(context).textTheme.subtitle2,),
        SizedBox(height: 20.0,),
        Text("Body text 1", style: Theme.of(context).textTheme.bodyText1,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hi there user!", style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 20.0,),
              TextButton(
                child: Text("See projects"),
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.projects,);
                },
              ),
              SizedBox(height: 20.0,),
              ChangeThemeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

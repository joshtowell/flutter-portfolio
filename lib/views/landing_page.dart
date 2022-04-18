// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';
import 'package:flutter_portfolio/constants.dart';

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
        Text("Headline 1", style: headline1(context),),
        SizedBox(height: 20.0,),
        Text("Headline 2", style: headline2(context),),
        SizedBox(height: 20.0,),
        Text("Subtitle 1", style: subtitle1(context),),
        SizedBox(height: 20.0,),
        Text("Subtitle 2", style: subtitle2(context),),
        SizedBox(height: 20.0,),
        Text("Body text 1", style: bodyText1(context),),
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
              Text("Hi there user!", style: subtitle1(context),),
              SizedBox(height: 20.0,),
              TextButton(
                child: Text("See projects"),
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.projects,);
                },
              ),
              SizedBox(height: 20.0,),
              ChangeThemeWidget(),
              SizedBox(height: 20.0,),
              fontsTest(),
            ],
          ),
        ),
      ),
    );
  }
}

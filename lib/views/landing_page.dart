// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:flutter_portfolio/controllers/responsive.dart';

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

  Widget plainContents() {
    return Column(
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
      ],
    );
  }

  Widget hook() {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding,),
      child: Text("Eye-catching visuals", style: headline1(context),),
    );
  }

  Widget bio() {
    return WideCard(
      child: Text("My name is Joshua Towell and I am making this portfolio look awesome!", style: subtitle1(context),),
    );
  }

  Widget projects() {
    return WideCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Check out these projects...", style: headline2(context),),
          TextButton(
            child: Text("See projects"),
            onPressed: () async {
              await Navigator.pushNamed(context, AppRoutes.projects,);
            },
          ),
        ],
      ),
    );
  }

  Widget qualifications() {
    return WideCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Qualifications", style: Theme.of(context).textTheme.headline2,),
            shoebox,
            Text("Qualification X", style: subtitle1(context),),
            shoebox,
            Text("Qualification Y", style: subtitle1(context),),
            shoebox,
            Text("Qualification Z", style: subtitle1(context),),
          ],
        ),
    );
  }

  Widget experience() {
    return WideCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Experience", style: Theme.of(context).textTheme.headline2,),
          shoebox,
          Text("Opportunity C", style: subtitle1(context),),
          shoebox,
          Text("Opportunity B", style: subtitle1(context),),
          shoebox,
          Text("Opportunity A", style: subtitle1(context),),
        ],
      ),
    );
  }

  Widget skills() {
    return WideCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skills", style: Theme.of(context).textTheme.headline2,),
          shoebox,
          Text("Juggling balls", style: subtitle1(context),),
          shoebox,
          Text("Juggling cubes", style: subtitle1(context),),
          shoebox,
          Text("Juggling dodecahedrons", style: subtitle1(context),),
        ],
      ),
    );
  }

  Widget contact() {
    return WideCard(
      child: Text("Contact me here!", style: headline2(context),),
    );
  }

  Widget mobileBuild() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding,),
        child: Column(
          children: [
            ChangeThemeWidget(),
            shoebox,
            contact(),
          ],
        ),
      ),
    );
  }

  Widget desktopBuild() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding,),
        child: Column(
          children: [
            ChangeThemeWidget(),
            shoebox,
            hook(),
            shoebox,
            bio(),
            shoebox,
            projects(),
            shoebox,
            qualifications(),
            shoebox,
            experience(),
            shoebox,
            skills(),
            shoebox,
            contact(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: mobileBuild(),
          tablet: mobileBuild(),
          desktop: desktopBuild(),
        ),
      ),
    );
  }
}

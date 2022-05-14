// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:flutter_portfolio/controllers/responsive.dart';
import 'package:provider/provider.dart';

import '../components/elevating_button.dart';
import '../controllers/app_routes.dart';
import '../controllers/app_themes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLightMode = false;
  Map<String, bool> workPersonalController = {"work": true, "personal": false,};

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

  /*Widget elevatedButton({Widget? child, double? padding,}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(padding ?? defaultPadding,),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? backgroundColour0Dark : backgroundColour0Light,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: (themeProvider.isDarkMode ? blackColour : backgroundColour3Dark).withOpacity(0.25),
            offset: Offset(0.0, 8.0,),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: child ?? Container(),
    );
  }*/

  Widget elevatedSwitch() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ElevatingButton(
      padding: defaultPadding * 0.5,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: workPersonalController!["work"]! ? (themeProvider.isDarkMode ? backgroundColour1Dark : backgroundColour1Light) : null,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.all(defaultPadding * 0.5,),
              child: Icon(Icons.business_center),
            ),
            onTap: () {
              workPersonalController["work"] = true;
              workPersonalController["personal"] = false;
              setState(() {});
            },
          ),
          SizedBox(width: defaultPadding * 0.5,),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: workPersonalController!["personal"]! ? (themeProvider.isDarkMode ? backgroundColour1Dark : backgroundColour1Light) : null,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.all(defaultPadding * 0.5,),
              child: Icon(Icons.person_rounded),
            ),
            onTap: () {
              workPersonalController["personal"] = true;
              workPersonalController["work"] = false;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget mobileBuild() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding,),
        child: Column(
          children: [
            /// Padding from behind navbar
            SizedBox(height: 64.0,),
            shoebox,
            contact(),shoebox,
            contact(),shoebox,
            contact(),shoebox,
            contact(),shoebox,
            contact(),shoebox,
            contact(),shoebox,
            contact(),shoebox,
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
        child: Stack(
          children: [
            Responsive(
              mobile: mobileBuild(),
              tablet: mobileBuild(),
              desktop: desktopBuild(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatingButton(child: ChangeThemeWidget()),
                  elevatedSwitch(),
                  ElevatingButton(child: Icon(Icons.menu_rounded)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

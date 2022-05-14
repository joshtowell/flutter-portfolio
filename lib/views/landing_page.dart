// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:flutter_portfolio/controllers/responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../components/elevating_button.dart';
import '../components/elevating_switch.dart';
import '../controllers/app_routes.dart';
import '../controllers/app_themes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Size screenSize = Size(0.0, 0.0);
  bool isLightMode = false;
  List <bool> workPersonalController = [true, false,];

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

  Widget workCard() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WideCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatingButton(
            hasShadow: false,
            padding: defaultPadding * 0.5,
            colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
            child: Image.asset("assets/images/pr_logo_small.png", width: 40.0, height: 40.0,),
          ),
          shoebox,
          Text("Probably Rational Ltd.", style: Theme.of(context).textTheme.headline1,),
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

  Widget navbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatingButton(child: ChangeThemeWidget()),
          ElevatingSwitch(
            initialState: workPersonalController,
            firstChild: Icon(Icons.business_center),
            firstAction: () => setState(() => workPersonalController = [true, false,]),
            secondChild: Icon(Icons.person_rounded),
            secondAction: () => setState(() => workPersonalController = [false, true,]),
          ),
          ElevatingButton(child: Icon(Icons.menu_rounded)),
        ],
      ),
    );
  }

  Widget workViewCards() {
    return Column(
      children: [
        workCard(),shoebox,
        workCard(),shoebox,
        workCard(),shoebox,
        workCard(),shoebox,
        workCard(),shoebox,
        workCard(),shoebox,
        workCard(),shoebox,
        fontsTest(),
      ],
    );
  }

  Widget personalViewCards() {
    return Column(
      children: [
        contact(),shoebox,
        contact(),shoebox,
        contact(),shoebox,
        contact(),shoebox,
        contact(),shoebox,
        contact(),shoebox,
        contact(),shoebox,
        contact(),
      ],
    );
  }

  Widget mobileBuild() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding,),
        child: Column(
          children: [
            /// Padding from behind navbar
            SizedBox(height: 64.0,),

            /// Start of first view
            SizedBox(
              height: screenSize.height * 0.8,
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            /// Temporary alignment adjustments until SVGs are ready
                            padding: const EdgeInsets.only(bottom: 24.0,),
                            child: Image.asset(workPersonalController[0] ? "assets/images/work_art.png" : "assets/images/personal_art.png"),
                          ),
                          // TODO: fix SVG opacity not obeying
                          /*ShaderMask(
                            shaderCallback: (bounds) {
                              return RadialGradient(
                                center: Alignment.center,
                                radius: 1,
                                colors: const [pinkHighlightColour, Color(0xFF5050D4),],
                                tileMode: TileMode.mirror,
                              ).createShader(bounds);
                            },
                            child: SvgPicture.asset(workPersonalController[0] ? "assets/svgs/work_art.svg" : "assets/svgs/personal_art.svg"),
                          ),*/
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Hi, I'm Joshua.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1,),
                      shoebox,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person_pin_circle_rounded, size: 16.0, color: themeProvider.isDarkMode ? backgroundColour3Dark : backgroundColour3Light,),
                          SizedBox(width: defaultPadding * 0.5,),
                          Text(
                            "Swansea, Wales",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: workPersonalController[0]
                                  ? (themeProvider.isDarkMode ? backgroundColour3Dark : backgroundColour3Light)
                                  : (themeProvider.isDarkMode ? pinkHighlightColour : purpleHighlightColour),
                            ),
                          ),
                        ],
                      ),
                      shoebox,
                      SizedBox(
                        height: screenSize.width * 0.25,
                        child: Text(
                          workPersonalController[0]
                              ? "I am currently a Cyber Security Masters’ student, looking for a graduate job in the Cyber Security industry."
                              : "An enthusiastic, independent and confident learner. Looking to develop my passion for UI/UX into an exciting freelance career.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatingButton(
                      padding: defaultPadding * 0.5,
                      child: Icon(Icons.expand_more_rounded, size: 40.0,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding * 4,),

            /// Start of second view
            workPersonalController[0] ? workViewCards() : personalViewCards(),
          ],
        ),
      ),
    );
  }

  Widget personalViewMobileBuild() {
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
            workCard(),
            shoebox,
            contact(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Responsive(
              mobile: mobileBuild(),
              tablet:  mobileBuild(),
              desktop: desktopBuild(),
            ),
            navbar(),
          ],
        ),
      ),
    );
  }
}

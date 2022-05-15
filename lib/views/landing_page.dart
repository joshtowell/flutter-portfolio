// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:flutter_portfolio/controllers/responsive.dart';
import 'package:provider/provider.dart';

import '../components/education_card.dart';
import '../components/elevating_button.dart';
import '../components/elevating_switch.dart';
import '../components/project_card.dart';
import '../components/qualification_card.dart';
import '../components/work_card.dart';
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
  bool isMenuOpen = false;
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

  Widget workViewCards() {
    return Column(
      children: [
        WorkCard(
          padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 0.0,),
          icon: Image.asset("assets/images/pr_logo_small.png", width: 40.0, height: 40.0,),
          companyName: "Probably Rational Ltd.",
          jobTitle: "Software Engineer",
          duration: "2 yrs, 8 mos",
          jobSummary: "Build and develop efficient applications based on specified requirements set by the client.",
          image: Image.asset("assets/images/ryb_mock_cropped.png"),
        ),
        SizedBox(height: defaultPadding * 3,),
        EducationCard(
          icon: Image.asset("assets/images/swansea_university_logo_crest.png", width: 40.0, height: 40.0,),
          institutionName: "Swansea University",
          qualificationTitle: "MSc Cyber Security",
          dates: "2021 - 2022",
          courseSummary: "A course covering critical modern technology issues from the security and privacy of personal data to cyberterrorism, cybercrime and mobile security.",
        ),
        SizedBox(height: defaultPadding * 3,),
        EducationCard(
          icon: Image.asset("assets/images/uol_logo_crest.png", width: 40.0, height: 40.0,),
          institutionName: "University of Lincoln",
          qualificationTitle: "BSc (Hons) Computer Science",
          dates: "2018 - 2021",
          courseSummary: "A 3 year course introducing essential Computer Science concepts and developing complex skills related to Cloud Computing, IoT, Machine Learning, Cyber Security and more.",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTC: Security, Compliance and Identity Fundamentals",
          issueDate: "Certified 2021",
          qualificationSummary: "",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTC: Azure AI Fundamentals",
          issueDate: "Certified 2021",
          qualificationSummary: "",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTA: Security Fundamentals",
          issueDate: "Certified 2020",
          qualificationSummary: "Experience with Windows Server, Windows-based networking, Active Directory, anti-malware products, firewalls, network topologies and devices, and network ports.",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTA: Networking Fundamentals",
          issueDate: "Certified 2020",
          qualificationSummary: "",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTC: Azure Fundamentals",
          issueDate: "Certified 2020",
          qualificationSummary: "",
        ),
        SizedBox(height: defaultPadding * 3,),
      ],
    );
  }

  Widget personalViewCards() {
    return Column(
      children: [
        ProjectCard(
          padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 0.0,),
          icon: Image.asset("assets/images/takeaway_coffee_icon.png", width: 40.0, height: 40.0,),
          projectName: "Coffee App Inc.",
          projectCategory: "Personal Project",
          projectSummary: "Reminders to drink your coffee and remembers where you left the it. Set timers for boiling and brewing, so you never waste time or coffee again!",
          image: Image.asset("assets/images/coffee_app_mocks_cropped.png"),
        ),
        SizedBox(height: defaultPadding * 3,),
        EducationCard(
          icon: Image.asset("assets/images/the_mentor_circle_logo.png", width: 40.0, height: 40.0,),
          institutionName: "The Mentor Circle",
          qualificationTitle: "Self-motivated Mentee",
          dates: "2020",
          courseSummary: "A six week mentorship programme for 18-25 year olds looking to develop their skills in starting a business and property investment. Talks from +30 mentors who are experts and successful in their fields.",
        ),
        SizedBox(height: defaultPadding * 3,),
        WorkCard(
          icon: Image.asset("assets/images/really_wild_logo.png", width: 40.0, height: 40.0,),
          companyName: "Really Wild Education",
          jobTitle: "Trainee Instructor",
          duration: "1 yr, 3 mos",
          jobSummary: "Teaching and leading young people methods and skills required to survive and thrive in the outdoor environment.",
        ),
        SizedBox(height: defaultPadding * 3,),
      ],
    );
  }

  Widget highlightingButton({
    required String text,
    required LinearGradient highlightGradient,
    required bool isSelected,
    required Function() tapAction,
  }) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(defaultPadding * 0.5,),
        color: Colors.transparent,
        child: isSelected
            ? ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return highlightGradient.createShader(bounds);
              },
              child: Text(text, style: subtitle1(context)?.copyWith(fontWeight: FontWeight.w800,),),
            )
            : Text(text, style: subtitle2(context)?.copyWith(fontWeight: FontWeight.w300,),),
      ),
      onTap: tapAction,
    );
  }

  Widget navbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatingButton(
                child: ChangeThemeWidget(disableTap: true,),
                tapAction: () {
                  final provider = Provider.of<ThemeProvider>(context, listen: false,);
                  provider.toggleTheme();
                },
              ),
              ElevatingSwitch(
                initialState: workPersonalController,
                firstChild: Icon(Icons.business_center),
                firstAction: () => setState(() => workPersonalController = [true, false,]),
                secondChild: Icon(Icons.person_rounded),
                secondAction: () => setState(() => workPersonalController = [false, true,]),
              ),
              ElevatingButton(
                child: Icon(Icons.menu_rounded),
                tapAction: () => setState(() => isMenuOpen = !isMenuOpen),
              ),
            ],
          ),
          isMenuOpen
            ? Column(
              children: [
                SizedBox(height: defaultPadding * 0.5,),
                ElevatingButton(
                  padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding * 3, defaultPadding,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      highlightingButton(
                        text: "About Me",
                        highlightGradient: purpleHighlightGradient,
                        isSelected: false,    // TODO: Create 'About Me' page and controller
                        tapAction: () => null,
                      ),
                      highlightingButton(
                        text: "Work",
                        highlightGradient: purpleHighlightGradient,
                        isSelected: workPersonalController[0],
                        tapAction: () => setState(() {
                          workPersonalController[0] = true;
                          workPersonalController[1] = false;
                        }),
                      ),
                      highlightingButton(
                        text: "Personal",
                        highlightGradient: purpleHighlightGradient,
                        isSelected: workPersonalController[1],
                        tapAction: () => setState(() {
                          workPersonalController[0] = false;
                          workPersonalController[1] = true;
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            )
            : Container(),
        ],
      ),
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
                            padding: const EdgeInsets.only(bottom: 32.0,),
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
                          style: bodyText1(context),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatingButton(
                      padding: EdgeInsets.all(defaultPadding * 0.5,),
                      child: Icon(Icons.expand_more_rounded, size: 40.0,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding * 4,),

            /// Start of second view
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
              child: workPersonalController[0] ? workViewCards() : personalViewCards(),
            ),
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
          children: const [
            ChangeThemeWidget(),
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
              tablet: mobileBuild(),
              desktop: desktopBuild(),
            ),
            navbar(),
          ],
        ),
      ),
    );
  }
}

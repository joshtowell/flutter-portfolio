// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/change_theme_widget.dart';
import 'package:flutter_portfolio/components/navbar.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:flutter_portfolio/controllers/responsive.dart';
import 'package:provider/provider.dart';

import '../components/education_card.dart';
import '../components/elevating_button.dart';
import '../components/project_card.dart';
import '../components/qualification_card.dart';
import '../components/work_card.dart';
import '../controllers/app_routes.dart';
import '../controllers/app_themes.dart';
import '../controllers/project_object_controller.dart';
import '../controllers/work_object_controller.dart';
import '../controllers/work_personal_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Size screenSize = Size(0.0, 0.0);
  bool isLightMode = false;

  final WorkObjectController _workObjectController = WorkObjectController();
  final ProjectObjectController _projectObjectController = ProjectObjectController();

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Visibility(
          visible: _workObjectController.list.isNotEmpty,
          child: WorkCard(
            workObject: _workObjectController.list.where((workObject) => workObject.companyName == "Probably Rational Ltd.").first,
            padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 0.0,),
          ),
        ),
        SizedBox(height: defaultPadding * 3,),
        EducationCard(
          icon: Image.asset(themeProvider.isDarkMode ? "assets/images/education/swansea_university_logo_crest_white.png" : "assets/images/education/swansea_university_logo_crest.png", width: 40.0, height: 40.0,),
          institutionName: "Swansea University",
          qualificationTitle: "MSc Cyber Security",
          dates: "2021 - 2022",
          courseSummary: "A course covering critical modern technology issues from the security and privacy of personal data to cyberterrorism, cybercrime and mobile security.",
        ),
        SizedBox(height: defaultPadding * 3,),
        EducationCard(
          icon: Image.asset("assets/images/education/uol_logo_crest.png", width: 40.0, height: 40.0,),
          institutionName: "University of Lincoln",
          qualificationTitle: "BSc (Hons) Computer Science",
          dates: "2018 - 2021",
          courseSummary: "A 3 year course introducing essential Computer Science concepts and developing complex skills related to Cloud Computing, IoT, Machine Learning, Cyber Security and more.",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/qualification/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTC: Security, Compliance and Identity Fundamentals",
          issueDate: "Certified 2021",
          qualificationSummary: "Ability to describe the following: concepts of security, compliance, and identity; capabilities of Microsoft identity and access management solutions; capabilities of Microsoft Security solutions; and capabilities of Microsoft compliance solutions.",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/qualification/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTC: Azure AI Fundamentals",
          issueDate: "Certified 2021",
          qualificationSummary: "Demonstrate understanding of: AI workloads and considerations; fundamental principles of machine learning on Azure; features of computer vision workloads on Azure; and features of Natural Language Processing (NLP) workloads on Azure.",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/qualification/ms_logo.png", width: 34.0, height: 34.0,),
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
            child: Image.asset("assets/images/qualification/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTA: Networking Fundamentals",
          issueDate: "Certified 2020",
          qualificationSummary: "Experience with Windows Server, Windows-based networking, network management tools, DNS, TCP/IP, names resolution process, and network protocols and topologies.",
        ),
        SizedBox(height: defaultPadding * 3,),
        QualificationCard(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/qualification/ms_logo.png", width: 34.0, height: 34.0,),
          ),
          institutionName: "Microsoft",
          qualificationTitle: "MTC: Azure Fundamentals",
          issueDate: "Certified 2020",
          qualificationSummary: "Knowledge of cloud concepts, Azure services, Azure workloads, security and privacy in Azure, as well as Azure pricing and support. Understanding of cloud concepts such as networking, storage, compute, application support, and application development.",
        ),
        SizedBox(height: defaultPadding * 3,),
      ],
    );
  }

  Widget personalViewCards() {
    return Column(
      children: [
        Visibility(
          visible: _workObjectController.list.isNotEmpty,
          child: ProjectCard(
            projectObject: _projectObjectController.list.where((projectObject) => projectObject.projectName == "Coffee App").first,
            padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 0.0,),
          ),
        ),
        SizedBox(height: defaultPadding * 3,),
        EducationCard(
          icon: Image.asset("assets/images/education/the_mentor_circle_logo.png", width: 40.0, height: 40.0,),
          institutionName: "The Mentor Circle",
          qualificationTitle: "Self-motivated Mentee",
          dates: "2020",
          courseSummary: "A six week mentorship programme for 18-25 year olds looking to develop their skills in starting a business and property investment. Talks from +30 mentors who are experts and successful in their fields.",
        ),
        SizedBox(height: defaultPadding * 3,),
        WorkCard(workObject: _workObjectController.list.where((workObject) => workObject.companyName == "Really Wild Education").first,),
        SizedBox(height: defaultPadding * 3,),
      ],
    );
  }

  Widget mobileBuild() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final workPersonalProvider = Provider.of<WorkPersonalProvider>(context);
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
                            child: Image.asset(workPersonalProvider.isWork ? "assets/images/work_art.png" : "assets/images/personal_art.png"),
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
                  Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 500,),
                      child: Column(
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
                                  color: workPersonalProvider.isWork
                                      ? (themeProvider.isDarkMode ? backgroundColour3Dark : backgroundColour3Light)
                                      : (themeProvider.isDarkMode ? pinkHighlightColour : purpleHighlightColour),
                                ),
                              ),
                            ],
                          ),
                          shoebox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
                            child: Text(
                              workPersonalProvider.isWork
                                  ? "I am currently a Cyber Security Masters’ student, looking for a graduate job in the Cyber Security industry."
                                  : "An enthusiastic, independent and confident learner. Looking to develop my passion for UI/UX into an exciting freelance career.",
                              textAlign: TextAlign.center,
                              style: bodyText1(context),
                            ),
                          ),
                        ],
                      ),
                    ),
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
            FutureBuilder(
              future: loadCardData(),
              builder: (context, snapshot) {
                /// Future hasn't finished yet, return a placeholder
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: CircularProgressIndicator(color: purpleHighlightColour, strokeWidth: 4.0,),
                        ),
                        SizedBox(height: defaultPadding * 3,),
                      ],
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
                  child: workPersonalProvider.isWork ? workViewCards() : personalViewCards(),
                );
              },
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

  Future<void> loadCardData() async {
    await _workObjectController.load(context);
    await _projectObjectController.load(context);
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              child: Responsive(
                mobile: mobileBuild(),
                tablet: mobileBuild(),
                desktop: desktopBuild(),
              ),
              /*onTap: () {
                    if (isMenuOpen) setState(() => isMenuOpen = false);
                  },*/
            ),
            Navbar(),
          ],
        ),
      ),
    );
  }
}

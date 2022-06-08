import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/elevating_button.dart';
import '../components/navbar.dart';
import '../constants.dart';
import '../controllers/app_themes.dart';
import '../controllers/responsive.dart';
import '../objects/project_object.dart';

class ProjectDetails extends StatefulWidget {
  final ProjectObject projectObject;

  const ProjectDetails({
    required this.projectObject,
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  Size screenSize = const Size(0.0, 0.0);

  List<Widget> generateUserStories() {
    List<Widget> _list = [];
    widget.projectObject.userStories?.forEach((key, value) {
      _list.add(widget.projectObject.makeUserStoriesItem(context: context, key: key,));
    });
    return _list;
  }

  List<Widget> generateProcessList() {
    List<Widget> _list = [];
    widget.projectObject.processList?.forEach((key, value) {
      _list.add(widget.projectObject.makeProcessItem(context: context, key: key,));
    });
    return _list;
  }

  Widget mobileBuild() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Header with image
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? backgroundColour1Dark : backgroundColour1Light,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0),
              ),
            ),
            child: (widget.projectObject.image?.isNotEmpty ?? false)
                ? Column(
                  children: [
                    /// Padding from behind navbar
                    const SizedBox(height: 90.0,),
                    Container(
                      height: screenSize.height * 0.2,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(widget.projectObject.image ?? '', fit: BoxFit.fitHeight,),
                    ),
                  ],
                )
                : SizedBox(height: 100.0, width: screenSize.width,),
          ),
          /// Icon, titles and summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding * 2,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 72.0,
                  width: 72.0,
                  padding: const EdgeInsets.all(defaultPadding * 0.5,),
                  child: widget.projectObject.makeIcon(),
                ),
                Text(widget.projectObject.projectName, textAlign: TextAlign.center, style: headline1(context),),
                const SizedBox(height: defaultPadding * 0.5,),
                Text(widget.projectObject.projectType, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
                const SizedBox(height: defaultPadding * 2,),
                Text(widget.projectObject.projectSummary, textAlign: TextAlign.center, style: bodyText1(context),),
              ],
            ),
          ),
          /// Role Summary
          Visibility(
            visible: widget.projectObject.projectMotivation?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Project Motivation", style: subtitle1(context),),
                  shoebox,
                  Text(widget.projectObject.projectMotivation ?? '', style: bodyText1(context),),
                ],
              ),
            ),
          ),
          shoebox,
          /// Feature image 1
          Visibility(
            visible: widget.projectObject.featureImage1?.isNotEmpty ?? false,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding,),
                  color: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
                  child: widget.projectObject.makeFeatureImage1(),
                ),
                shoebox,
              ],
            ),
          ),
          /// Key responsibilities
          Visibility(
            visible: widget.projectObject.userStories?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("User Stories", style: subtitle1(context),),
                  shoebox,
                  Column(
                    children: generateUserStories(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2,),
          /// Project involvement
          Visibility(
            visible: widget.projectObject.processList?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Processes and Outcomes", style: subtitle1(context),),
                  shoebox,
                  Column(
                    children: generateProcessList(),
                  ),
                ],
              ),
            ),
          ),
          /// Padding from behind back button
          const SizedBox(height: defaultPadding * 3,),
        ],
      ),
    );
  }

  Widget desktopBuild() {
    return Container();
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
            const Navbar(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding, bottom: defaultPadding,),
                child: ElevatingButton(
                  child: const Icon(Icons.arrow_back,),
                  tapAction: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

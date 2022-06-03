import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/navbar.dart';
import '../constants.dart';
import '../controllers/app_themes.dart';
import '../controllers/responsive.dart';
import '../objects/work_object.dart';

class WorkDetails extends StatefulWidget {
  final WorkObject workObject;

  const WorkDetails({
    required this.workObject,
    Key? key,
  }) : super(key: key);

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  Size screenSize = const Size(0.0, 0.0);

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
            child: widget.workObject.image != null
                ? Column(
                  children: [
                    /// Padding from behind navbar
                    const SizedBox(height: 90.0,),
                    Container(
                      height: screenSize.height * 0.2,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(widget.workObject.image ?? '', fit: BoxFit.fitHeight,),
                    ),
                  ],
                )
                : SizedBox(height: 110.0, width: screenSize.width,),
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
                  child: widget.workObject.makeIcon(),
                ),
                Text(widget.workObject.companyName, textAlign: TextAlign.center, style: headline1(context),),
                const SizedBox(height: defaultPadding * 0.5,),
                Text("${widget.workObject.jobTitle} • ${widget.workObject.duration}", style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
                const SizedBox(height: defaultPadding * 2,),
                Text(widget.workObject.jobSummary, textAlign: TextAlign.center, style: bodyText1(context),),
              ],
            ),
          ),
          /// Role Summary
          Visibility(
            visible: widget.workObject.roleSummary != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Role Summary", style: subtitle1(context),),
                  const SizedBox(height: defaultPadding * 0.5,),
                  Text(widget.workObject.roleSummary ?? '', style: bodyText1(context),),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2,),
          widget.workObject.makeImage(),
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
          ],
        ),
      ),
    );
  }
}

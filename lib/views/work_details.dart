import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/elevating_button.dart';
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

  List<Widget> generateKeyResponsibilities() {
    List<Widget> _list = [];
    widget.workObject.keyResponsibilities?.forEach((key, value) {
      _list.add(widget.workObject.makeResponsibilitiesItem(context: context, key: key,));
    });
    return _list;
  }

  List<Widget> generateInvolvementList() {
    List<Widget> _list = [];
    widget.workObject.involvementList?.forEach((key, value) {
      _list.add(widget.workObject.makeInvolvementItem(context: context, key: key,));
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
            child: (widget.workObject.image?.isNotEmpty ?? false)
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
            visible: widget.workObject.roleSummary?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Role Summary", style: subtitle1(context),),
                  shoebox,
                  Text(widget.workObject.roleSummary ?? '', style: bodyText1(context),),
                  shoebox,
                ],
              ),
            ),
          ),
          /// Feature image 1
          Visibility(
            visible: widget.workObject.featureImage1?.isNotEmpty ?? false,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding,),
                  color: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
                  child: widget.workObject.makeFeatureImage1(),
                ),
                shoebox,
              ],
            ),
          ),
          /// Key responsibilities
          Visibility(
            visible: widget.workObject.keyResponsibilities?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Key Responsibilities", style: subtitle1(context),),
                  shoebox,
                  Column(
                    children: generateKeyResponsibilities(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2,),
          /// Project involvement
          Visibility(
            visible: widget.workObject.involvementList?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Project Involvement", style: subtitle1(context),),
                  shoebox,
                  Column(
                    children: generateInvolvementList(),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 880,
          ),
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
                child: (widget.workObject.image?.isNotEmpty ?? false)
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
                    : SizedBox(height: 100.0, width: screenSize.width,),
              ),
              /// Icon, titles and summary
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding * 3,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
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
                visible: widget.workObject.roleSummary?.isNotEmpty ?? false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Role Summary", style: subtitle1(context),),
                      shoebox,
                      Text(widget.workObject.roleSummary ?? '', style: bodyText1(context),),
                      shoebox,
                    ],
                  ),
                ),
              ),
              /// Feature image 1
              Visibility(
                visible: widget.workObject.featureImage1?.isNotEmpty ?? false,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding,),
                      color: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
                      child: widget.workObject.makeFeatureImage1(),
                    ),
                    shoebox,
                  ],
                ),
              ),
              /// Key responsibilities
              Visibility(
                visible: widget.workObject.keyResponsibilities?.isNotEmpty ?? false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Key Responsibilities", style: subtitle1(context),),
                      shoebox,
                      Responsive.isDesktop(context) ? shoebox : const SizedBox(),
                      Column(
                        children: generateKeyResponsibilities(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding * 2,),
              /// Project involvement
              Visibility(
                visible: widget.workObject.involvementList?.isNotEmpty ?? false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3, vertical: defaultPadding,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Project Involvement", style: subtitle1(context),),
                      shoebox,
                      Column(
                        children: generateInvolvementList(),
                      ),
                    ],
                  ),
                ),
              ),
              /// Padding from behind back button
              const SizedBox(height: defaultPadding * 3,),
            ],
          ),
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
            const Align(
              alignment: Alignment.topCenter,
              child: Navbar(),
            ),
            Responsive.isDesktop(context)
            ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding, bottom: defaultPadding, right: 744,),
                child: ElevatingButton(
                  child: const Icon(Icons.arrow_back,),
                  tapAction: () => Navigator.pop(context),
                  ),
                ),
              )
            : Align(
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

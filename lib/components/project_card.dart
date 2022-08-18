import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import '../controllers/responsive.dart';
import '../objects/project_object.dart';
import '../views/project_details.dart';
import 'elevating_button.dart';

class ProjectCard extends StatelessWidget {
  final ProjectObject projectObject;
  final EdgeInsetsGeometry? padding;
  final bool underDevelopment;

  const ProjectCard({
    required this.projectObject,
    this.padding,
    this.underDevelopment = false,
    Key? key,
  }) : super(key: key);

  Future<void> _handlePopNavigation(BuildContext context) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, pushAnimation, popAnimation) => ProjectDetails(projectObject: projectObject),
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, pushAnimation, popAnimation, child) {
          return SlideTransition(
            position: pushAnimation.drive(slideTween),
            child: child,
          );
        }
      ),
    );
  }

  Widget developmentChip(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.5, horizontal: defaultPadding,),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) {
          return purpleHighlightGradient.createShader(bounds);
        },
        child: Text("Under development", style: bodyText2(context),),
      ),
    );
  }

  Widget mobileBuild(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WideCard(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatingButton(
                hasShadow: false,
                padding: const EdgeInsets.all(defaultPadding * 0.5,),
                colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
                child: projectObject.makeIcon(),
              ),
              underDevelopment
                  ? developmentChip(context)
                  : const Icon(Icons.chevron_right_rounded, size: 40.0,),
            ],
          ),
          shoebox,
          Text(projectObject.projectName, style: headline1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(projectObject.projectType, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          shoebox,
          Text(projectObject.projectSummary, style: bodyText1(context),),
          Visibility(
            visible: projectObject.image?.isNotEmpty ?? false,
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 2,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: projectObject.makeImage(),
                ),
              ],
            ),
          ),
        ],
      ),
      tapAction: () async {
        if (!underDevelopment) {
          await _handlePopNavigation(context);
        }
      },
    );
  }

  Widget desktopBuild(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WideCard(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatingButton(
                hasShadow: false,
                padding: const EdgeInsets.all(defaultPadding * 0.5,),
                colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
                child: projectObject.makeIcon(),
              ),
              underDevelopment
                ? developmentChip(context)
                : const Icon(Icons.chevron_right_rounded, size: 40.0,),
            ],
          ),
          shoebox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(projectObject.projectName, style: Responsive.isTablet(context) ? headline1(context) : headline2(context)?.copyWith(fontSize: 38.0,),),
                    const SizedBox(height: defaultPadding * 0.25,),
                    Text(projectObject.projectType, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
                    shoebox,
                    Text(projectObject.projectSummary, style: bodyText1(context),),
                    shoebox,
                    Responsive.isDesktop(context) ? shoebox : const SizedBox(),
                  ],
                ),
              ),
              shoebox,
              Expanded(
                flex: (projectObject.image?.isNotEmpty ?? false) ? 1 : 0,
                child: Visibility(
                  visible: projectObject.image?.isNotEmpty ?? false,
                  child: projectObject.makeImage(fit: BoxFit.fitHeight,),
                ),
              ),
            ],
          ),
        ],
      ),
      tapAction: () async {
        if (!underDevelopment) {
          await _handlePopNavigation(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: mobileBuild(context),
      tablet: desktopBuild(context),
      desktop: desktopBuild(context),
    );
  }
}
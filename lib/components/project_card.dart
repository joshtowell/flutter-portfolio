import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class ProjectCard extends StatelessWidget {
  final Widget icon;
  final String projectName;
  final String projectCategory;
  final String projectSummary;
  final Widget? image;
  final EdgeInsetsGeometry? padding;

  const ProjectCard({
    required this.icon,
    required this.projectName,
    required this.projectCategory,
    required this.projectSummary,
    this.image,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: icon,
              ),
              const Icon(Icons.chevron_right_rounded, size: 40.0,)
            ],
          ),
          shoebox,
          Text(projectName, style: headline1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(projectCategory, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          shoebox,
          Text(projectSummary, style: bodyText1(context),),
          const SizedBox(height: defaultPadding * 2,),
          Align(
            alignment: Alignment.bottomCenter,
            child: image ?? Container(),
          ),
        ],
      ),
    );
  }
}
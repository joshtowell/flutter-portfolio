import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_routes.dart';
import '../controllers/app_themes.dart';
import '../objects/project_object.dart';
import 'elevating_button.dart';

class ProjectCard extends StatelessWidget {
  final ProjectObject projectObject;
  final EdgeInsetsGeometry? padding;

  const ProjectCard({
    required this.projectObject,
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
                child: projectObject.makeIcon(),
              ),
              const Icon(Icons.chevron_right_rounded, size: 40.0,)
            ],
          ),
          shoebox,
          Text(projectObject.projectName, style: headline1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(projectObject.projectType, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          shoebox,
          Text(projectObject.projectSummary, style: bodyText1(context),),
          const SizedBox(height: defaultPadding * 2,),
          Align(
            alignment: Alignment.bottomCenter,
            child: projectObject.makeImage(),
          ),
        ],
      ),
      tapAction: () async {
        final args = projectObject;
        await Navigator.pushNamed(context, AppRoutes.projectDetails, arguments: args,);
      },
    );
  }
}
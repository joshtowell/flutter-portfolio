import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class EducationCard extends StatelessWidget {
  final Widget icon;
  final String institutionName;
  final String qualificationTitle;
  final String dates;
  final String courseSummary;
  final EdgeInsetsGeometry? padding;

  const EducationCard({
    required this.icon,
    required this.institutionName,
    required this.qualificationTitle,
    required this.dates,
    required this.courseSummary,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WideCard(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatingButton(
            hasShadow: false,
            padding: const EdgeInsets.all(defaultPadding * 0.5,),
            colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
            child: icon,
          ),
          const SizedBox(height: defaultPadding * 1.5,),
          Text(institutionName, textAlign: TextAlign.center, style: bodyText1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(qualificationTitle, textAlign: TextAlign.center, style: headline2(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(dates, textAlign: TextAlign.center, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          const SizedBox(height: defaultPadding * 1.5,),
          Text(courseSummary, textAlign: TextAlign.center, style: bodyText1(context),),
        ],
      ),
    );
  }
}
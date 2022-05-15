import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class QualificationCard extends StatelessWidget {
  final Widget icon;
  final String institutionName;
  final String qualificationTitle;
  final String issueDate;
  final String qualificationSummary;
  final EdgeInsetsGeometry? padding;
  final bool isExpanded;

  const QualificationCard({
    required this.icon,
    required this.institutionName,
    required this.qualificationTitle,
    required this.issueDate,
    required this.qualificationSummary,
    this.padding,
    this.isExpanded = false,
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
            padding: defaultPadding * 0.5,
            colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
            child: icon,
          ),
          const SizedBox(height: defaultPadding * 1.5,),
          Text(institutionName, textAlign: TextAlign.center, style: bodyText1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(qualificationTitle, textAlign: TextAlign.center, style: headline2(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(issueDate, textAlign: TextAlign.center, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          // shoebox,
          GestureDetector(
            child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(top: defaultPadding + 8.0,),
                  child: Text(qualificationSummary, textAlign: TextAlign.center, style: bodyText1(context),),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,),
                  child: Text("...", textAlign: TextAlign.center, style: headline2(context)?.copyWith(color: backgroundColour3Light),),
                ),
            /*onTap: () => setState(() {
              isExpanded = !isExpanded;
            }),*/
          ),
        ],
      ),
    );
  }
}
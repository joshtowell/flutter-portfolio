import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class WorkCard extends StatelessWidget {
  final Widget icon;
  final String companyName;
  final String jobTitle;
  final String duration;
  final String jobSummary;
  final Widget? image;
  final EdgeInsetsGeometry? padding;

  const WorkCard({
    required this.icon,
    required this.companyName,
    required this.jobTitle,
    required this.duration,
    required this.jobSummary,
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
                padding: defaultPadding * 0.5,
                colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
                child: icon,
              ),
              const Icon(Icons.chevron_right_rounded, size: 40.0,)
            ],
          ),
          shoebox,
          Text(companyName, style: headline1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text("$jobTitle • $duration", style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          shoebox,
          Text(jobSummary, style: bodyText1(context),),
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
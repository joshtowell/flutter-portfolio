import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:flutter_portfolio/objects/work_object.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_routes.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class WorkCard extends StatelessWidget {
  final WorkObject workObject;
  final EdgeInsetsGeometry? padding;

  const WorkCard({
    required this.workObject,
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
                child: workObject.makeIcon(),
              ),
              const Icon(Icons.chevron_right_rounded, size: 40.0,)
            ],
          ),
          shoebox,
          Text(workObject.companyName, style: headline1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text("${workObject.jobTitle} • ${workObject.duration}", style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          shoebox,
          Text(workObject.jobSummary, style: bodyText1(context),),
          const SizedBox(height: defaultPadding * 2,),
          Align(
            alignment: Alignment.bottomCenter,
            child: workObject.makeImage(),
          ),
        ],
      ),
      tapAction: () async {
        final args = workObject;
        await Navigator.pushNamed(context, AppRoutes.workDetails, arguments: args,);
      },
    );
  }
}
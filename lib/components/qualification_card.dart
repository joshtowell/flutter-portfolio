import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class QualificationCard extends StatefulWidget {
  final Widget icon;
  final String institutionName;
  final String qualificationTitle;
  final String issueDate;
  final String qualificationSummary;
  final EdgeInsetsGeometry? padding;
  final bool isExpandedInitial;

  const QualificationCard({
    required this.icon,
    required this.institutionName,
    required this.qualificationTitle,
    required this.issueDate,
    required this.qualificationSummary,
    this.padding,
    this.isExpandedInitial = false,
    Key? key,
  }) : super(key: key);

  @override
  State<QualificationCard> createState() => _QualificationCardState();
}

class _QualificationCardState extends State<QualificationCard> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpandedInitial;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WideCard(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatingButton(
            hasShadow: false,
            padding: const EdgeInsets.all(defaultPadding * 0.5,),
            colour: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,
            child: widget.icon,
          ),
          const SizedBox(height: defaultPadding * 1.5,),
          Text(widget.institutionName, textAlign: TextAlign.center, style: bodyText1(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(widget.qualificationTitle, textAlign: TextAlign.center, style: headline2(context),),
          const SizedBox(height: defaultPadding * 0.25,),
          Text(widget.issueDate, textAlign: TextAlign.center, style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
          // shoebox,
          GestureDetector(
            child: isExpanded && widget.qualificationSummary.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.only(top: defaultPadding + 8.0,),
                  color: Colors.transparent,
                  child: Text(widget.qualificationSummary, textAlign: TextAlign.center, style: bodyText1(context),),
                )
              : widget.qualificationSummary.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: defaultPadding * 4,),
                    color: Colors.transparent,
                    child: Text("...", textAlign: TextAlign.center, style: headline2(context)?.copyWith(color: backgroundColour3Light),),
                  )
                : Container(),
            onTap: () => setState(() => isExpanded = !isExpanded),
          ),
        ],
      ),
    );
  }
}
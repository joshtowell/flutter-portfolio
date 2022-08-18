import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/wide_card.dart';
import 'package:flutter_portfolio/objects/work_object.dart';
import 'package:flutter_portfolio/views/work_details.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_routes.dart';
import '../controllers/app_themes.dart';
import '../controllers/responsive.dart';
import 'elevating_button.dart';

class WorkCard extends StatelessWidget {
  final WorkObject workObject;
  final EdgeInsetsGeometry? padding;

  const WorkCard({
    required this.workObject,
    this.padding,
    Key? key,
  }) : super(key: key);

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
          Visibility(
            visible: workObject.image?.isNotEmpty ?? false,
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 2,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: workObject.makeImage(),
                ),
              ],
            ),
          ),
        ],
      ),
      tapAction: () async {
        final args = workObject;
        await Navigator.pushNamed(context, AppRoutes.workDetails, arguments: args,);
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
                child: workObject.makeIcon(),
              ),
              const Icon(Icons.chevron_right_rounded, size: 40.0,)
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
                    Text(workObject.companyName, style: Responsive.isTablet(context) ? headline1(context) : headline2(context)?.copyWith(fontSize: 38.0,),),
                    const SizedBox(height: defaultPadding * 0.25,),
                    Text("${workObject.jobTitle} • ${workObject.duration}", style: bodyText2(context)?.copyWith(color: backgroundColour3Light),),
                    shoebox,
                    Text(workObject.jobSummary, style: bodyText1(context),),
                    shoebox,
                    Responsive.isDesktop(context) ? shoebox : const SizedBox(),
                  ],
                ),
              ),
              shoebox,
              Expanded(
                flex: (workObject.image?.isNotEmpty ?? false) ? 1 : 0,
                child: Visibility(
                  visible: workObject.image?.isNotEmpty ?? false,
                  child: workObject.makeImage(fit: BoxFit.fitHeight,),
                ),
              ),
            ],
          ),
        ],
      ),
      tapAction: () async {
        // final args = workObject;
        // await Navigator.pushNamed(context, AppRoutes.workDetails, arguments: args,);
        final slideTween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero,).chain(CurveTween(curve: Curves.easeInOutQuart));
        await Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => WorkDetails(workObject: workObject),
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (context, pushAnimation, popAnimation, child) {
              return SlideTransition(
                position: pushAnimation.drive(slideTween),
                child: child,
              );
            }
          ),
        );
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
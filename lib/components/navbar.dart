import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/controllers/work_personal_controller.dart';
import 'package:flutter_portfolio/views/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import '../controllers/responsive.dart';
import 'change_theme_widget.dart';
import 'elevating_button.dart';
import 'elevating_switch.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isMenuOpen = false;

  final SnackBar _copiedEmailSnackBar = SnackBar(
    width: 300,
    behavior: SnackBarBehavior.floating,
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    backgroundColor: Colors.green,
    content: const Row(
      children: [
        Icon(Icons.check_rounded, color: whiteColour,),
        shoebox,
        Flexible(child: Text('Copied! My email address is in your clipboard.')),
      ],
    ),
  );

  void _launchMailTo() async {
    try {
      await launchUrl(Uri(
        scheme: 'mailto',
        path: contactEmail,
        /// Switched from 'queryParameters' to 'query' to avoid UTF-8 mis-formatting on Windows
        query: "subject=👋 Hello, let's talk!",
      ));
    } catch (e) {
      await Clipboard.setData(const ClipboardData(text: contactEmail));
      ScaffoldMessenger.of(context).showSnackBar(_copiedEmailSnackBar);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Widget highlightingButton({
    required String text,
    required LinearGradient highlightGradient,
    required bool isSelected,
    required Function() tapAction,
  }) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * 0.5,),
        color: Colors.transparent,
        child: isSelected
          ? ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return highlightGradient.createShader(bounds);
              },
              child: Text(text, style: subtitle1(context)?.copyWith(fontWeight: FontWeight.w800,),),
            )
          : Text(text, style: subtitle2(context)?.copyWith(fontWeight: FontWeight.w300,),),
      ),
      onTap: tapAction,
    );
  }

  Widget menu() {
    final workPersonalProvider = Provider.of<WorkPersonalProvider>(context);
    return ElevatingButton(
      padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding * 2, defaultPadding,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*highlightingButton(
            text: "About Me",
            highlightGradient: purpleHighlightGradient,
            isSelected: false,    // TODO: Create 'About Me' page and controller
            tapAction: () => null,
          ),*/
          highlightingButton(
            text: "Work",
            highlightGradient: purpleHighlightGradient,
            isSelected: workPersonalProvider.isWork,
            tapAction: () => setState(() {
              final provider = Provider.of<WorkPersonalProvider>(context, listen: false,);
              provider.setWork();
              /// Replaces and navigates to page widget with no animations
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const LandingPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }),
          ),
          highlightingButton(
            text: "Personal",
            highlightGradient: purpleHighlightGradient,
            isSelected: workPersonalProvider.isPersonal,
            tapAction: () => setState(() {
              final provider = Provider.of<WorkPersonalProvider>(context, listen: false,);
              provider.setPersonal();
              /// Replaces and navigates to page widget with no animations
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const LandingPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }),
          ),
          highlightingButton(
            text: "Contact Me",
            highlightGradient: purpleHighlightGradient,
            isSelected: false,
            tapAction: () => _launchMailTo(),
          ),
          /*Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.4,),
                  color: Colors.transparent,
                  child: SvgPicture.asset("assets/svgs/linkedin_icon.svg", color: linkedInColour, colorBlendMode: BlendMode.srcIn, width: 24.0, height: 24.0,),
                ),
                // onTap: tapAction,    // TODO: Add OpenURL plugin for opening external webpages
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.4,),
                  color: Colors.transparent,
                  child: SvgPicture.asset("assets/svgs/github1_icon.svg", color: githubColour, colorBlendMode: BlendMode.srcIn, width: 24.0, height: 24.0,),
                ),
                // onTap: tapAction,    // TODO: Add OpenURL plugin for opening external webpages
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.5,),
                  color: Colors.transparent,
                  child: const Icon(Icons.description, color: purpleHighlightColour, size: 22.0,),
                ),
                // onTap: tapAction,    // TODO: Add OpenURL plugin for opening external webpages
              ),
            ],
          ),*/
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // isMenuOpen = widget.isMenuOpen;
    // workPersonalController = widget.workPersonalController;
  }

  @override
  Widget build(BuildContext context) {
    final workPersonalProvider = Provider.of<WorkPersonalProvider>(context);
    return Container(
      constraints: BoxConstraints(maxWidth: Responsive.isMobile(context) ? 400 : (Responsive.isTablet(context) ? 600 : 800),),
      margin: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatingButton(
                child: const ChangeThemeWidget(disableTap: true,),
                tapAction: () {
                  final provider = Provider.of<ThemeProvider>(context, listen: false,);
                  provider.toggleTheme();
                  if (isMenuOpen) setState(() => isMenuOpen = false);
                },
              ),
              ElevatingSwitch(
                initialState: [workPersonalProvider.isWork, workPersonalProvider.isPersonal,],
                firstChild: const Icon(Icons.business_center),
                firstAction: () => setState(() {
                  final provider = Provider.of<WorkPersonalProvider>(context, listen: false,);
                  provider.setWork();
                  if (isMenuOpen) isMenuOpen = false;
                  /// Replaces and navigates to page widget with no animations
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const LandingPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }),
                secondChild: const Icon(Icons.person_rounded),
                secondAction: () => setState(() {
                  final provider = Provider.of<WorkPersonalProvider>(context, listen: false,);
                  provider.setPersonal();
                  if (isMenuOpen) isMenuOpen = false;
                  /// Replaces and navigates to page widget with no animations
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const LandingPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }),
              ),
              ElevatingButton(
                child: const Icon(Icons.menu_rounded),
                tapAction: () => setState(() => isMenuOpen = !isMenuOpen),
              ),
            ],
          ),
          isMenuOpen
            ? Column(
                children: [
                  const SizedBox(height: defaultPadding * 0.5,),
                  menu(),
                ],
              )
            : Container(),
        ],
      ),
    );
  }
}

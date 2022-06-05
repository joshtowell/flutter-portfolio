import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/controllers/work_personal_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
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

  void _launchMailTo() async {
    try {
      await launchUrl(Uri(
        scheme: 'mailto',
        path: contactEmail,
        queryParameters: {'subject': "👋 Hello, let's talk!"},
      ));
    } catch (e) {
      await Clipboard.setData(const ClipboardData(text: contactEmail));   // TODO: Add snackbar for user confirmation of copy to clipboard
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
            }),
          ),
          highlightingButton(
            text: "Personal",
            highlightGradient: purpleHighlightGradient,
            isSelected: workPersonalProvider.isPersonal,
            tapAction: () => setState(() {
              final provider = Provider.of<WorkPersonalProvider>(context, listen: false,);
              provider.setPersonal();
            }),
          ),
          highlightingButton(
            text: "Contact Me",
            highlightGradient: purpleHighlightGradient,
            isSelected: false,    // TODO: Add temporary highlight with local variable and change to conditionals
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding,),
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
                }),
                secondChild: const Icon(Icons.person_rounded),
                secondAction: () => setState(() {
                  final provider = Provider.of<WorkPersonalProvider>(context, listen: false,);
                  provider.setPersonal();
                  if (isMenuOpen) isMenuOpen = false;
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

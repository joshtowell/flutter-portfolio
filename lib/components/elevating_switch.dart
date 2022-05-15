import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/app_themes.dart';
import 'elevating_button.dart';

class ElevatingSwitch extends StatefulWidget {
  final List<bool> initialState;
  final Widget firstChild;
  final Widget secondChild;
  final Function() firstAction;
  final Function() secondAction;

  const ElevatingSwitch({
    required this.initialState,
    required this.firstChild,
    required this.firstAction,
    required this.secondChild,
    required this.secondAction,
    Key? key,
  }) : super(key: key);

  @override
  _ElevatingSwitchState createState() => _ElevatingSwitchState();
}

class _ElevatingSwitchState extends State<ElevatingSwitch> {
  List <bool> switchController = [true, false];

  @override
  void initState() {
    super.initState();
    switchController = widget.initialState;
  }

  Widget highlightBox({required Widget child, required bool isSelected, required Function() onChildTap}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? (themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour1Light) : null,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(defaultPadding * 0.5,),
        child: child,
      ),
      onTap: onChildTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatingButton(
      padding: const EdgeInsets.all(defaultPadding * 0.5,),
      child: Row(
        children: [
          highlightBox(
            child: widget.firstChild,
            isSelected: switchController[0],
            onChildTap:  () {
              switchController[0] = true;
              switchController[1] = false;
              setState(widget.firstAction);
            },
          ),
          const SizedBox(width: defaultPadding * 0.5,),
          highlightBox(
            child: widget.secondChild,
            isSelected: switchController[1],
            onChildTap:  () {
              switchController[0] = false;
              switchController[1] = true;
              setState(widget.secondAction);
            },
          ),
        ],
      ),
    );
  }
}

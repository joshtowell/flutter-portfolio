import 'package:flutter/material.dart';

import '../objects/work_object.dart';

class WorkDetails extends StatelessWidget {
  final WorkObject workObject;

  const WorkDetails({
    required this.workObject,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.greenAccent,
      ),
    );
  }
}

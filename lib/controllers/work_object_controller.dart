import 'dart:convert' show json;

import 'package:flutter/material.dart';

import '../objects/work_object.dart';

class WorkObjectController {
  List<WorkObject> list = [];

  load(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/experience_data.json");
    Map<String, dynamic> workData = json.decode(data)['work'];
    workData.forEach((key, value) {
      list.add(WorkObject.fromJson(value));
    });
  }
}
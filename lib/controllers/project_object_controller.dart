import 'dart:convert' show json;

import 'package:flutter/material.dart';

import '../objects/project_object.dart';

class ProjectObjectController {
  List<ProjectObject> list = [];

  load(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/experience_data.json");
    Map<String, dynamic> projectData = json.decode(data)['project'];
    projectData.forEach((key, value) {
      list.add(ProjectObject.fromJson(value));
    });
  }
}
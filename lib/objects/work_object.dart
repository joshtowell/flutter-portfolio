import 'package:flutter/material.dart';

class WorkObject {
  final String icon;
  final String companyName;
  final String jobTitle;
  final String duration;
  final String jobSummary;
  final String? image;
  final String? roleSummary;

  WorkObject({
    required this.icon,
    required this.companyName,
    required this.jobTitle,
    required this.duration,
    required this.jobSummary,
    this.image,
    this.roleSummary,
  });

  WorkObject.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        companyName = json['companyName'],
        jobTitle = json['jobTitle'],
        duration = json['duration'],
        jobSummary = json['jobSummary'],
        image = json['image'],
        roleSummary = json['roleSummary']
  ;

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'companyName': companyName,
    'jobTitle': jobTitle,
    'duration': duration,
    'jobSummary': jobSummary,
    'image': image,
    'roleSummary': roleSummary,
  };



  Widget makeIcon() {
    return Image.asset(icon, width: 40.0, height: 40.0,);
  }

  Widget makeImage() {
    return image != null ? Image.asset(image ?? '',) : Container();
  }
}
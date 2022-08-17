import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';

import '../controllers/responsive.dart';

class ProjectObject {
  final String icon;
  final String projectName;
  final String projectType;
  final String projectSummary;
  final String? image;
  final String? projectMotivation;
  final String? featureImage1;
  final Map<String, dynamic>? userStories;
  final Map<String, dynamic>? processList;

  ProjectObject({
    required this.icon,
    required this.projectName,
    required this.projectType,
    required this.projectSummary,
    this.image,
    this.projectMotivation,
    this.featureImage1,
    this.userStories,
    this.processList,
  });

  ProjectObject.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        projectName = json['projectName'],
        projectType = json['projectType'],
        projectSummary = json['projectSummary'],
        image = json['image'],
        projectMotivation = json['projectMotivation'],
        featureImage1 = json['featureImage1'],
        userStories = json['userStories'],
        processList = json['processList']
  ;

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'projectName': projectName,
    'projectType': projectType,
    'projectSummary': projectSummary,
    'image': image,
    'projectMotivation': projectMotivation,
    'featureImage1': featureImage1,
    'userStories': userStories,
    'processList': processList,
  };

  Widget makeIcon() {
    return Image.asset(icon, width: 40.0, height: 40.0,);
  }

  Widget makeImage() {
    return image != null ? Image.asset(image ?? '',) : Container();
  }

  Widget makeFeatureImage1() {
    return featureImage1 != null ? Image.asset(featureImage1 ?? '',) : Container();
  }

  Widget makeUserStoriesItem({required BuildContext context, required String key}) {
    String? _icon = userStories![key]['icon'];
    String? _text = userStories![key]['text'];
    return Visibility(
      visible: _text?.isNotEmpty ?? false,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: _icon?.isNotEmpty ?? false,
                child: Row(
                  children: [
                    Icon(IconData(int.parse(_icon ?? '0xf06cb'), fontFamily: 'MaterialIcons',), size: 24.0,),
                    shoebox,
                  ],
                ),
              ),
              Flexible(child: Text(_text ?? '', style: bodyText1(context),)),
            ],
          ),
          shoebox,
          Responsive.isDesktop(context) ? shoebox : const SizedBox(),
        ],
      ),
    );
  }

  Widget makeProcessItem({required BuildContext context, required String key}) {
    String? _title = processList![key]['title'];
    String? _summary = processList![key]['summary'];
    String? _image = processList![key]['image'];
    String? _results = processList![key]['results'];
    return Visibility(
      visible: (_title?.isNotEmpty ?? false) && (_summary?.isNotEmpty ?? false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: _title?.isNotEmpty ?? false,
            child: Column(
              children: [
                Text(_title ?? '', style: bodyText1(context)?.copyWith(fontWeight: FontWeight.bold,),),
                shoebox,
              ],
            ),
          ),
          Visibility(
            visible: _summary?.isNotEmpty ?? false,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(child: Text(_summary ?? '', style: bodyText1(context),)),
                  ],
                ),
                shoebox,
              ],
            ),
          ),
          Visibility(
            visible: _image?.isNotEmpty ?? false,
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 0.5,),
                SizedBox(
                  width: Responsive.isDesktop(context) ? 500 : null,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.asset(_image ?? '', errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) => Container(),),
                  ),
                ),
                const SizedBox(height: defaultPadding * 1.5,),
              ],
            ),
          ),
          Visibility(
            visible: _results?.isNotEmpty ?? false,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(child: Text(_results ?? '', style: bodyText1(context),)),
                  ],
                ),
                shoebox,
              ],
            ),
          ),
          const SizedBox(height: defaultPadding * 0.5,),
        ],
      ),
    );
  }
}
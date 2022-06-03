import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';

class WorkObject {
  final String icon;
  final String companyName;
  final String jobTitle;
  final String duration;
  final String jobSummary;
  final String? image;
  final String? roleSummary;
  final String? featureImage1;
  final Map<String, dynamic>? keyResponsibilities;
  final Map<String, dynamic>? involvementList;

  WorkObject({
    required this.icon,
    required this.companyName,
    required this.jobTitle,
    required this.duration,
    required this.jobSummary,
    this.image,
    this.roleSummary,
    this.featureImage1,
    this.keyResponsibilities,
    this.involvementList,
  });

  WorkObject.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        companyName = json['companyName'],
        jobTitle = json['jobTitle'],
        duration = json['duration'],
        jobSummary = json['jobSummary'],
        image = json['image'],
        roleSummary = json['roleSummary'],
        featureImage1 = json['featureImage1'],
        keyResponsibilities = json['keyResponsibilities'],
        involvementList = json['involvementList']
  ;

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'companyName': companyName,
    'jobTitle': jobTitle,
    'duration': duration,
    'jobSummary': jobSummary,
    'image': image,
    'roleSummary': roleSummary,
    'featureImage1': featureImage1,
    'keyResponsibilities': keyResponsibilities,
    'involvementList': involvementList,
  };

  /*List<Map<String, String>> keyResponsibilitiesToList() {
    List<Map<String, String>> _list = [];
    keyResponsibilities?.forEach((key, value) => _list.add(value));
    return _list;
  }

  List<Map<String, String>> involvementListToList() {
    List<Map<String, String>> _list = [];
    involvementList?.forEach((key, value) => _list.add(value));
    return _list;
  }*/

  Widget makeIcon() {
    return Image.asset(icon, width: 40.0, height: 40.0,);
  }

  Widget makeImage() {
    return image != null ? Image.asset(image ?? '',) : Container();
  }

  Widget makeFeatureImage1() {
    return featureImage1 != null ? Image.asset(featureImage1 ?? '',) : Container();
  }

  Widget makeResponsibilitiesItem({required BuildContext context, required String key}) {
    String? _icon = keyResponsibilities![key]['icon'];
    String? _text = keyResponsibilities![key]['text'];
    return Visibility(
      visible: _text != null,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: _icon != null,
                child: Row(
                  children: [
                    Icon(IconData(int.parse(_icon ?? '0xf06cb'), fontFamily: 'MaterialIcons',), size: 28.0,),
                    shoebox,
                  ],
                ),
              ),
              Flexible(child: Text(_text ?? '', style: bodyText1(context),)),
            ],
          ),
          shoebox,
        ],
      ),
    );
  }
}
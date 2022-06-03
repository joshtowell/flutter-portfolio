import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:provider/provider.dart';

import '../controllers/app_themes.dart';

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
                    Icon(IconData(int.parse(_icon ?? '0xf06cb'), fontFamily: 'MaterialIcons',), size: 24.0,),
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

  Widget makeInvolvementItem({required BuildContext context, required String key}) {
    String? _title = involvementList![key]['title'];
    String? _summary = involvementList![key]['summary'];
    String? _image = involvementList![key]['image'];
    String? _involvement = involvementList![key]['involvement'];
    String? _url = involvementList![key]['url'];
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Visibility(
      visible: _title != null && _summary != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: _title != null,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_title ?? '', style: bodyText1(context)?.copyWith(fontWeight: FontWeight.bold,),),
                    _url != null
                      ? GestureDetector(
                        child: Icon(Icons.language_rounded, size: 20.0, color: themeProvider.isDarkMode ? backgroundColour2Dark : backgroundColour2Light,),
                        // onTap: () => ,   // TODO: add link to open url
                      ) : Container(),
                  ],
                ),
                shoebox,
              ],
            ),
          ),
          Visibility(
            visible: _summary != null,
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
            visible: _image != null,
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 0.5,),
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(_image ?? '', errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) => Container(),),
                ),
                const SizedBox(height: defaultPadding * 1.5,),
              ],
            ),
          ),
          Visibility(
            visible: _involvement != null,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(child: Text(_involvement ?? '', style: bodyText1(context),)),
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
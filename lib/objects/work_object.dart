import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';
import 'package:provider/provider.dart';

import '../controllers/app_themes.dart';
import '../controllers/responsive.dart';

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

  Widget makeIcon() {
    return Image.asset(icon, width: 40.0, height: 40.0,);
  }

  Widget makeImage({BoxFit? fit,}) {
    return image != null ? Image.asset(image ?? '', fit: fit,) : Container();
  }

  Widget makeFeatureImage1() {
    return featureImage1 != null ? Image.asset(featureImage1 ?? '',) : Container();
  }

  Widget makeResponsibilitiesItem({required BuildContext context, required String key}) {
    String? _icon = keyResponsibilities![key]['icon'];
    String? _text = keyResponsibilities![key]['text'];
    return Visibility(
      visible: _text?.isNotEmpty ?? false,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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

  Widget makeInvolvementItem({required BuildContext context, required String key}) {
    String? _title = involvementList![key]['title'];
    String? _summary = involvementList![key]['summary'];
    String? _image = involvementList![key]['image'];
    String? _involvement = involvementList![key]['involvement'];
    String? _url = involvementList![key]['url'];
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Visibility(
      visible: (_title?.isNotEmpty ?? false) && (_summary?.isNotEmpty ?? false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: _title?.isNotEmpty ?? false,
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
            child: Center(
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
          ),
          Visibility(
            visible: _involvement?.isNotEmpty ?? false,
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
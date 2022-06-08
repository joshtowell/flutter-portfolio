// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants.dart';

import '../controllers/app_routes.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Welcome to my projects!", style: subtitle1(context),),
              SizedBox(height: 20.0,),
              TextButton(
                child: Text("Back to Landing"),
                onPressed: () async {
                  await Navigator.pushNamedAndRemoveUntil(context, AppRoutes.landing, (r) => false,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

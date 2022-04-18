// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
              Text("Welcome to my projects!", style: Theme.of(context).textTheme.subtitle1,),
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

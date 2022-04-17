// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../controllers/appRoutes.dart';
import '../objects/loginArguments.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hi there user!"),
              SizedBox(height: 20.0,),
              TextButton(
                child: Text("To Projects"),
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.projects,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

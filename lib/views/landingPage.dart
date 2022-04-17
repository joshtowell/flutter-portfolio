// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../AppRoutes.dart';
import '../loginArguments.dart';

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
                child: Text("To Page 2"),
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.pageTwo,);
                },
              ),
              TextButton(
                child: Text("To Page 3"),
                onPressed: () async {
                  final args = LoginArguments(username: "JohnDoe", password: "password",);
                  await Navigator.pushNamed(context, AppRoutes.pageThree, arguments: args,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/loginArguments.dart';

class PageThree extends StatelessWidget {
  final LoginArguments? arguments;

  const PageThree({
    this.arguments,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("This is page 3"),
              SizedBox(height: 20.0,),
              Text("Username: ${arguments?.username}"),
              SizedBox(height: 20.0,),
              Text("Password: ${arguments?.password}"),
              SizedBox(height: 20.0,),
              TextButton(
                child: Text("Back to Landing"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

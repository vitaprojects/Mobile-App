import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/WelcomeMessageCard.dart';

import '../globals.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: blockHeight * 100,
              width: blockWidth * 100,
              color: Colors.orange,
            ),
            Container(
              height: blockHeight * 100,
              width: blockWidth * 100,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                children: [
                  WelcomeMessageCard(
                    title1: "welcome to new postman",
                    title2: "Welcome back",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/LoginFormField.dart';
import 'package:newpostman1/customWidgets/WelcomeMessageCard.dart';
import 'package:newpostman1/customWidgets/WelcomeScreenButtons.dart';

import '../globals.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: blockHeight * 100,
                width: blockWidth * 100,
                // color: Colors.orange,
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
                      title2: "create a new account",
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    LoginFormField(
                      hintText: "Enter your first name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    LoginFormField(
                      hintText: "Enter your last name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    LoginFormField(
                      hintText: "Enter your mobile number",
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    LoginFormField(
                      hintText: "Enter your email address",
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    LoginFormField(
                      hintText: "Enter your password",
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: blockHeight * 3,
                    ),
                    Expanded(
                        child: Container(
                      // color: Colors.red,
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            25,
                          )),
                          color: Globals.mainColor,
                          padding: EdgeInsets.all(
                            0,
                          ),
                          onPressed: () {},
                          child: Container(
                            height: blockHeight * 8,
                            // color: Colors.green,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 4,
                              // color: Colors.redAccent,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                "done".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/LoginFormField.dart';
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
                    title2: "Welcome back",
                  ),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  LoginFormField(
                    hintText: "Enter your email",
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: blockHeight * 1,
                  ),
                  LoginFormField(
                    hintText: "Enter your password",
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: blockHeight * 5,
                  ),
                  Expanded(
                      //height is blockhright*42
                      child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: blockHeight * 5,
                          margin: EdgeInsets.symmetric(
                            horizontal: blockWidth * 5,
                          ),
                          // color: Colors.green,
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: blockHeight * 3,
                            // color: Colors.redAccent,
                            alignment: Alignment.centerRight,
                            child: AutoSizeText(
                              "forgot password ?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                                  "login".toUpperCase(),
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
                        Container(
                          margin: EdgeInsets.only(
                            bottom: blockHeight * 3,
                            left: blockWidth * 5,
                            right: blockWidth * 5,
                          ),
                          height: blockHeight * 3,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                // color: Colors.orange,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account ? ",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        //create new account
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                            left: blockWidth * 2,
                                          ),
                                          // color: Colors.yellow,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: blockWidth,
                                          ),
                                          child: Text(
                                            "SIGNUP HERE",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Globals.mainColor,
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

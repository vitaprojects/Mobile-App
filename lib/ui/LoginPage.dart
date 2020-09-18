import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/LoginFormField.dart';
import 'package:newpostman1/customWidgets/WelcomeMessageCard.dart';
import 'package:newpostman1/ui/HomePage.dart';
import 'package:newpostman1/ui/SignUpPage.dart';

import '../globals.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _formBuilderKey =
      GlobalKey<FormBuilderState>();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(
          0xffd8fdf1,
        ),
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
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formBuilderKey,
                  child: Column(
                    children: [
                      WelcomeMessageCard(
                        //height is 30
                        title1: "welcome to new postman",
                        title2: "Welcome back",
                      ),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          15,
                        )),
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(
                                0xffaffde4,
                              ),
                              borderRadius: BorderRadius.circular(
                                15,
                              )),
                          height: blockHeight * 10,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: blockWidth * 5,
                          ),
                          child: FormBuilderTextField(
                            attribute: "email",
                            validators: [
                              FormBuilderValidators.email(),
                              FormBuilderValidators.required(),
                            ],
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              // filled: true,
                              // fillColor: Colors.yellow,
                              hintText: "Enter your email",
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockHeight * 1,
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          15,
                        )),
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(
                                0xffaffde4,
                              ),
                              borderRadius: BorderRadius.circular(
                                15,
                              )),
                          height: blockHeight * 10,
                          // color: Colors.grey,
                          alignment: Alignment.center,

                          padding: EdgeInsets.symmetric(
                            horizontal: blockWidth * 5,
                          ),
                          child: FormBuilderTextField(
                            obscureText: hidePassword,
                            attribute: "password",
                            validators: [FormBuilderValidators.required()],
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockHeight * 5,
                      ),
                      Container(
                        height: blockHeight * 38,
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
                                onPressed: () {
                                  // Get.to(HomePage());
                                  print("validate");
                                  _formBuilderKey.currentState
                                      .saveAndValidate();
                                },
                                child: Container(
                                  height: blockHeight * 6,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            Get.to(SignUpPage());
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
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

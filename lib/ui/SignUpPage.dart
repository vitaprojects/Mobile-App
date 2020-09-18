import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/LoginFormField.dart';
import 'package:newpostman1/customWidgets/WelcomeMessageCard.dart';
import 'package:newpostman1/customWidgets/WelcomeScreenButtons.dart';
import 'package:newpostman1/ui/HomePage.dart';

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
        backgroundColor: Color(
          0xffd8fdf1,
        ),
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
                          attribute: "fname",
                          validators: [
                            // FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ],
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.yellow,
                            hintText: "Enter your first name",
                            prefixIcon: Icon(
                              Icons.person,
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
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: FormBuilderTextField(
                          attribute: "lname",
                          validators: [
                            // FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ],
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.yellow,
                            hintText: "Enter your last name",
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
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: FormBuilderTextField(
                          attribute: "phone",
                          validators: [
                            FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ],
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.yellow,
                            hintText: "Enter your phone number",
                            prefixIcon: Icon(
                              Icons.call,
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
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: FormBuilderTextField(
                          attribute: "password",
                          validators: [
                            // FormBuilderValidators.email(),
                            FormBuilderValidators.required(),
                          ],
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.yellow,
                            hintText: "Enter your password",
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
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
                          onPressed: () {
                            Get.to(HomePage());
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

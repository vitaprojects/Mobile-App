import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/authentication/presentation/LoginFormField.dart';
import 'package:newpostman1/features/authentication/presentation/LoginPageViewModel.dart';
import 'package:newpostman1/features/welcome/presentation/WelcomeMessageCard.dart';
import 'package:newpostman1/features/authentication/presentation/SignUpView.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return ViewModelBuilder<LoginPageViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
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
                          LoginFormField(
                            controller: model.emailController,
                            attribute: "email",
                            hintText: "Enter your email",
                            icon: Icons.email,
                            isPassword: false,
                          ),
                          SizedBox(
                            height: blockHeight * 1,
                          ),
                          LoginFormField(
                            controller: model.passwordController,
                            attribute: "password",
                            hintText: "Enter your password",
                            icon: Icons.lock,
                            isPassword: true,
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
                                      model.validateUserInput();
                                      // Get.to(HomePage());
                                      // print("validate");
                                      // _formBuilderKey.currentState.saveAndValidate();
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
                                                Get.to(SignUpView());
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => LoginPageViewModel());
  }
}

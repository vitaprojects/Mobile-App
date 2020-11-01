import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/authentication/presentation/LoginFormField.dart';
import 'package:newpostman1/features/authentication/presentation/SignUpViewModel.dart';
import 'package:newpostman1/features/welcome/presentation/WelcomeMessageCard.dart';
import 'package:newpostman1/features/welcome/presentation/WelcomeScreenButtons.dart';
import 'package:newpostman1/ui/HomePage.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class SignUpView extends StatelessWidget {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 10,
                            ),
                            child: FormBuilderTextField(
                              controller: model.fnametextEditingController,
                              attribute: "fname",
                              validators: [
                                // FormBuilderValidators.email(),
                                FormBuilderValidators.required(),
                              ],
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(
                                  0xffaffde4,
                                ),
                                hintText: "Enter your first name",
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Globals.mainColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Globals.mainColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.red,
                            height: blockHeight * 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 10,
                            ),
                            child: FormBuilderTextField(
                              controller: model.lnametextEditingController,
                              attribute: "lname",
                              validators: [
                                // FormBuilderValidators.email(),
                                FormBuilderValidators.required(),
                              ],
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(
                                  0xffaffde4,
                                ),
                                hintText: "Enter your last name",
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Globals.mainColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Globals.mainColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: blockHeight * 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 10,
                            ),
                            child: FormBuilderTextField(
                              keyboardType: TextInputType.phone,
                              controller: model.phonetextEditingController,
                              attribute: "phone",
                              validators: [
                                // FormBuilderValidators.email(),
                                FormBuilderValidators.required(),
                              ],
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(
                                  0xffaffde4,
                                ),
                                hintText: "Enter your phone number",
                                prefixIcon: Icon(
                                  Icons.call,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Globals.mainColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Globals.mainColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: blockHeight * 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 10,
                            ),
                            child: FormBuilderTextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: model.emailtextEditingController,
                              attribute: "email",
                              validators: [
                                // FormBuilderValidators.email(),
                                FormBuilderValidators.required(),
                              ],
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(
                                  0xffaffde4,
                                ),
                                hintText: "Enter your email",
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Globals.mainColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Globals.mainColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: blockHeight * 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 10,
                            ),
                            child: FormBuilderTextField(
                              controller: model.passwordtextEditingController,
                              attribute: "password",
                              validators: [
                                // FormBuilderValidators.email(),
                                FormBuilderValidators.required(),
                              ],
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(
                                  0xffaffde4,
                                ),
                                hintText: "Enter your password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Globals.mainColor, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Globals.mainColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.red),
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
                                  // Get.to(HomePage());
                                  model.validateUserInput();
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
        },
        viewModelBuilder: () => SignUpViewModel());
  }
}

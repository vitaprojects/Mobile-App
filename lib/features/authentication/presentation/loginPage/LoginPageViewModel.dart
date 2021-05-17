import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class LoginPageViewModel extends ChangeNotifier {
  ///This is used to get the [`email`] input
  TextEditingController _emailtextEditingController = TextEditingController();

  ///This is used to get the [`password`] input

  TextEditingController _passtextEditingController = TextEditingController();

  ///Return the email [`controller`]

  TextEditingController get emailController => _emailtextEditingController;

  ///Return the password [`controller`]
  TextEditingController get passwordController => _passtextEditingController;

  final SnackBarService snackBarService = locator<SnackBarService>();
  // final SnackbarService snackbarService = locator<SnackbarService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  ///validate the [`input`] added by the user

  validateUserInput() {
    if (isEmail(_emailtextEditingController.text.trim()) == true) {
      if (_passtextEditingController.text.isNotEmpty) {
        print("user input is valid");
        Get.to(LoadingPage(text: "Please wait"));
        authenticationService.signIn(_emailtextEditingController.text.trim(),
            _passtextEditingController.text);
        _emailtextEditingController.text = _passtextEditingController.text = "";
      } else {
        snackBarService.showSnackBar(
            "Input Error", "Please enter a valid password", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Input Error", "Please enter a valid email", true);
    }
  }

  TextEditingController forgetPasstextEditingController =
      TextEditingController();

  ///Show forgot password [`dialog`] box

  showForgotPasswordDialogBox(context) {
    print("show forgot password dialog");
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetPassword();
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Globals.mainColor,
                    ),
                  )),
            ],
            title: Text("Forgot Password ?"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Globals.blockHeight * 2,
                  ),
                  // height: Globals.blockHeight * 6,
                  // color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: Text("Enter your email to reset your password"),
                ),
                TextField(
                  controller: forgetPasstextEditingController,
                  decoration: InputDecoration(
                      hintText: "Enter your email here",
                      suffixIcon: Icon(
                        Icons.email,
                      )),
                )
              ],
            ),
          );
        },
      );
    } else {
      //TODO implemnt the dialog box for ios
    }
  }

  ///validate forget password [`text field`]
  resetPassword() {
    if (forgetPasstextEditingController.text.trim().isNotEmpty &&
        isEmail(forgetPasstextEditingController.text.trim())) {
      authenticationService
          .sendResetMail(forgetPasstextEditingController.text.trim());
      forgetPasstextEditingController.text = '';
    } else {
      snackBarService.showSnackBar(
          "Input Error", "Please enter a valid email", true);
    }
  }
}

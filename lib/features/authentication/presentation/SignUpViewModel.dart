import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class SignUpViewModel extends ChangeNotifier {
  TextEditingController fnametextEditingController = TextEditingController();
  TextEditingController lnametextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  TextEditingController get getFnameController => fnametextEditingController;

  TextEditingController get getLnameController => lnametextEditingController;
  TextEditingController get getphoneleController => phonetextEditingController;
  TextEditingController get getemailController => emailtextEditingController;
  TextEditingController get getPasswordController =>
      passwordtextEditingController;

  final SnackBarService snackBarService = locator<SnackBarService>();
  // final SnackbarService snackbarService = locator<SnackbarService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  void validateUserInput() {
    if (fnametextEditingController.text.isNotEmpty) {
      if (lnametextEditingController.text.isNotEmpty) {
        if (phonetextEditingController.text.isNotEmpty) {
          if (isEmail(emailtextEditingController.text)) {
            if (passwordtextEditingController.text.length >= 6) {
              String value = passwordtextEditingController.text;
              bool hasUppercase = value.trim().contains(new RegExp(r'[A-Z]'));
              bool hasDigits = value.trim().contains(new RegExp(r'[0-9]'));
              bool hasLowercase = value.trim().contains(new RegExp(r'[a-z]'));
              bool hasSpecialCharacters =
                  value.trim().contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

              if (hasUppercase &
                  hasDigits &
                  hasLowercase &
                  hasSpecialCharacters) {
                print("user input is valid");
                UserModel userModel = UserModel(
                  email: emailtextEditingController.text,
                  fname: fnametextEditingController.text,
                  lname: lnametextEditingController.text,
                  phone: phonetextEditingController.text,
                  deviceIds: [],
                  totalEarnings: 0,
                );
                Get.to(
                  LoadingPage(
                    text: "Please wait while we are creating your account",
                  ),
                );
              } else {
                snackBarService.showSnackBar(
                    "Input Error",
                    "Password should contain at least 1 Uppercase letter , 1 Digit , 1 Special Character, 1 LowerCase Letter",
                    true);
              }
            } else {
              snackBarService.showSnackBar(
                  "Input Error", "Please enter a valid password", true);
            }
          } else {
            snackBarService.showSnackBar(
                "Input Error", "Please enter a valid email", true);
          }
        } else {
          snackBarService.showSnackBar(
              "Input Error", "Please enter a valid phone number", true);
        }
      } else {
        snackBarService.showSnackBar(
            "Input Error", "Please enter a valid last name", true);
      }
    } else {
      // snackBarService.showSnackBar("", body, isDanger)
      snackBarService.showSnackBar(
          "Input Error", "Please enter a valid first name", true);
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class LoginPageViewModel extends ChangeNotifier {
  TextEditingController _emailtextEditingController = TextEditingController();
  TextEditingController _passtextEditingController = TextEditingController();

  TextEditingController get emailController => _emailtextEditingController;
  TextEditingController get passwordController => _passtextEditingController;

  final SnackBarService snackBarService = locator<SnackBarService>();
  // final SnackbarService snackbarService = locator<SnackbarService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  validateUserInput() {
    if (isEmail(_emailtextEditingController.text.trim()) == true) {
      if (_passtextEditingController.text.trim().isNotEmpty) {
        print("user input is valid");
        authenticationService.signIn(_emailtextEditingController.text.trim(),
            _passtextEditingController.text.trim());
      } else {
        snackBarService.showSnackBar(
            "Input Error", "Please enter a valid password", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Input Error", "Please enter a valid email", true);
    }
  }
}

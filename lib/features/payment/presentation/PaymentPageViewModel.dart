import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class PaymentPageViewModel extends ChangeNotifier {
  TextEditingController amountTextController = TextEditingController();
  TextEditingController tipTextController = TextEditingController();
  TextEditingController totalamountTextController = TextEditingController();
  final SnackBarService snackBarService = locator<SnackBarService>();
  String publicKeyForPaystack =
      'pk_test_fbd29b4288bdeff6f8d6a755d2acac12812246a7';

  RequestModel requestModelOfTheOrder;

  initialiseData(RequestModel requestModel) {
    PaystackPlugin.initialize(publicKey: publicKeyForPaystack);
    amountTextController.text = requestModel.postmanOffer.toString();
    tipTextController.addListener(() {
      print("tip changed");
      totalamountTextController.text = (requestModel.postmanOffer +
              double.parse(tipTextController.text.isEmpty
                  ? "0"
                  : tipTextController.text)) //TODO add the commison of us here
          .toString();
      notifyListeners();
    });
  }

  bool validateInputData() {
    bool isValid = false;
    if (amountTextController.text.isNotEmpty &&
        isFloat(amountTextController.text.trim())) {
      if ((tipTextController.text.isNotEmpty &&
              isFloat(tipTextController.text)) ||
          tipTextController.text.isEmpty) {
      } else {
        snackBarService.showSnackBar(
            "Input error", "Please enter a vaid tip", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Input error", "Please enter a vaid amount", true);
    }

    return isValid;
  }

  payUsingPayStack() {}
}

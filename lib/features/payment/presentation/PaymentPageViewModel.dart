import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';
import 'package:http/http.dart' as http;

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
    totalamountTextController.text = requestModel.postmanOffer.toString();
    requestModelOfTheOrder = requestModel;
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

  void payUsingPayStack(BuildContext context) async {
    Charge charge = Charge()
      ..amount = double.parse(totalamountTextController.text).toInt()
      //  ..reference = _getReference()
      ..accessCode = await _fetchAccessCodeFrmServer(_getReference())
      ..email = 'customer@email.com';
    CheckoutResponse response = await PaystackPlugin.checkout(
      context,
      charge: charge,
    );
    print(response);
  }

  void payUsingPaypal() {}

  void payUsingStripe() {}

  Future<String> _fetchAccessCodeFrmServer(String reference) async {
    //this access code is created when we initialse the transaction
    String url = 'https://api.paystack.co/transaction/initialize';
    String accessCode;
    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization":
              "Bearer " + "sk_test_984a58e2a697c0530763720c0a527ff3c7c67026",
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{
          'email': requestModelOfTheOrder.user,
          'amount': totalamountTextController.text,
          'reference': reference,
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        final jsonResponse = jsonDecode(response.body);
        // print(jsonResponse['data']);
        accessCode = jsonResponse['data']['access_code'];
        print(accessCode);
      }
      // http.Response response = await http.get(url);
      // accessCode = response.body;
    } catch (e) {
      // setState(() => _inProgress = false);
      // _updateStatus(
      //     reference,
      //     'There was a problem getting a new access code form'
      //     ' the backend: $e');
    }

    return accessCode;
  }

  String _getReference() {
    //this method will get a reference to the payment process
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/app_constants.dart';
import 'package:uuid/uuid.dart';

import '../../../find_postman_for_package/data/RequestModel.dart';

abstract class PaymentDataSource {
  Future<void> addOrder(
      RequestModel requestModel, CreditCardModel cardModel, double tip);
}

class PaymentDataSourceImpl extends PaymentDataSource {
  final FirebaseAuth firebaseAuth;
  final Uuid uuid;
  final FirebaseFirestore firebaseFirestore;
  final SnackBarService snackbarService;
  PaymentDataSourceImpl({
    @required this.firebaseAuth,
    @required this.uuid,
    @required this.firebaseFirestore,
    @required this.snackbarService,
  });
  @override
  Future<void> addOrder(
      RequestModel requestModel, CreditCardModel cardModel, double tip) async {
    try {
      final uId = uuid.v4();
      final subtotal = requestModel.postmanOffer + tip;
      final gst = (subtotal * AppConstants.SALES_TAX).toPrecision(2);
      OrderModel orderModel = OrderModel(
        postmanFee: requestModel
            .postmanOffer, //we dont any info about these they are in the errand document
        pacakgeDocId: requestModel.packageDocID,
        postmanEmail: requestModel.postman,
        statusOftheOrder: 0, //in the beggining of te order the status is 0
        tipAmount: tip, //in the begniing we are not paying the tip
        type: 1, //because this is a order of a package
        userEmail: firebaseAuth.currentUser.email,
        subtotal: subtotal,
        gst: gst,
        orderID: uId,
        totalAmount: subtotal + gst,
      );

      final String secretKey = await getSecretKey();
      final String paymentMethodId = await createPaymentMethod(
          int.parse(cardModel.cvvCode.toString()),
          int.parse(cardModel.expiryDate.substring(0, 2)),
          int.parse(cardModel.expiryDate.substring(3, 5)),
          cardModel.cardNumber,
          secretKey);

      ///* to create the intent with amount
      ///[`cad`] dollar multiple it by cents $1 * 100
      ///[`lkr`] 1 rs => 1*100
      final paymentIntent = await createPaymentIntent(
          '${((orderModel.totalAmount.toPrecision(2)) * AppConstants.STRIPE_CENTS).round()}',
          AppConstants.CURRENCY,
          secretKey);
      final rsp = await confirmPaymentIntent(
          paymentMethodId, paymentIntent['id'], secretKey);
      if (rsp == 'succeeded') {
        await firebaseFirestore.runTransaction<void>((transaction) async {
          transaction.set(firebaseFirestore.collection('orders').doc(uId),
              orderModel.toJson());
        });
        //  'Thanks for your payment. Your order id=> $uId';
        snackbarService.showSnackBar('Payment Success',
            'Thanks for your payment. Your order id=> $uId', false);

        Future.delayed(Duration(seconds: 3), () {
          Get.close(1);
        });
      } else {
        throw Exception('An Error Occured while making the payment $rsp');
      }
    } on PlatformException catch (e) {
      // throw ServerException(errorMessage: e.message)
      snackbarService.showSnackBar('Payment Error', e.message, true);
    } on FirebaseException catch (e) {
      // throw ServerException(errorMessage: e.message);
      snackbarService.showSnackBar('Payment Error', e.message, true);
    } on Exception catch (e) {
      // throw ServerException(errorMessage: e.toString());
      snackbarService.showSnackBar('Payment Error', e.toString(), true);
    }
  }

  @visibleForTesting
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency, String secretKey) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
        'receipt_email': firebaseAuth.currentUser.email,
      };

      // String secretKey = await _getSecretKey();
      Map<String, String> headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var response = await http.post(
          'https://api.stripe.com/v1/payment_intents',
          body: body,
          headers: headers);
      Logger().wtf(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw HttpException(
            'A server error occured while trying to connect ${response.statusCode}${response.reasonPhrase}');
      }
    } on HttpException catch (e) {
      throw FirebaseException(message: e.message, plugin: 'intent_error');
    } catch (err) {
      print('err charging user: ${err.toString()}');
      throw Exception(err.toString());
    }
  }

  @visibleForTesting
  Future<String> getSecretKey() async {
    Logger().wtf('called function');
    try {
      final HttpsCallable intent = FirebaseFunctions.instance.httpsCallable(
        'getClientSecret',
      );
      return intent.call().then((value) {
        return value.data['secretKey'];
      });
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @visibleForTesting
  Future<String> createPaymentMethod(int cvc, int expMonth, int expYear,
      String cardNumber, String secretKey) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      Map<String, dynamic> body = {
        'card[number]': cardNumber.toString(),
        'card[exp_month]': expMonth.toString(),
        'card[exp_year]': expYear.toString(),
        'card[cvc]': cvc.toString(),
        'type': 'card'
      };
      final response = await http.post(
          'https://api.stripe.com/v1/payment_methods',
          body: body,
          headers: headers);
      final decode = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return decode['id'];
      } else {
        throw HttpException(decode['error']['message'] ??
            "Error occured while processing the card information");
      }
    } on HttpException catch (e) {
      throw FirebaseException(message: e.message, plugin: 'invalid_card');
    } catch (err) {
      print('err charging user: ${err.toString()}');
      throw Exception(err.toString());
    }
  }

  @visibleForTesting
  Future<String> confirmPaymentIntent(
      String paymentMethodId, String paymentIntentId, String secretKey) async {
    try {
      assert(paymentIntentId != null, 'Payment intent id cannot be null');
      assert(paymentMethodId != null, 'Payment method id cannot be null');
      assert(secretKey != null, 'Secret key cannot be null');
      Map<String, String> headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      Map<String, dynamic> body = {
        'payment_method': paymentMethodId,
      };
      final response = await http.post(
          'https://api.stripe.com/v1/payment_intents/$paymentIntentId/confirm',
          body: body,
          headers: headers);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        return res['status'];
      } else {
        throw Exception(
            'A server error occured while trying to connect ${response.statusCode}${response.reasonPhrase}');
      }
    } on HttpException catch (e) {
      throw Exception(e.message.toString());
    } catch (err) {
      print('err charging user: ${err.toString()}');
      throw Exception(err.toString());
    }
  }
}

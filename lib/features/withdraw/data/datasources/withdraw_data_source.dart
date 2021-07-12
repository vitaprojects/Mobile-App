import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:newpostman1/features/withdraw/data/models/withdrawModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class WithdrawDataSource {
  Future<void> createStripeConnectedAccount();
  Future<WithdrawModel> getStripeAccountDetails(String stripeId);
  Future<void> createAccountLink(String accountId);
  Future<void> withdraw(String accountId, double amout);
}

class WithdataSourceImpl implements WithdrawDataSource {
  final FirebaseFirestore firebaseFirestore;
  final SnackBarService snackBarService;
  final FirebaseAuth firebaseAuth;
  WithdataSourceImpl({
    @required this.firebaseFirestore,
    @required this.snackBarService,
    @required this.firebaseAuth,
  });
  @override
  Future<void> createStripeConnectedAccount() async {
    try {
      // final String secretKey = await getSecretKey();

      final res = await http.post(
        '${AppConstants.Api_Path}/createaccount',
        body: {
          "email": firebaseAuth.currentUser.email,
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        String accountLink = data["data"]["account_link"];
        Logger().d('account link is created ${data['data']['stripeId']}');

        if (accountLink != null) {
          await _launchUrl(accountLink);
        }
      } else {
        throw Exception('Cannot create an account At the moment');
      }
    } on FirebaseException catch (e) {
      snackBarService.showSnackBar('Account Creation Failure', e.message, true);
    } on Exception catch (e) {
      Logger().e(e.toString());
      snackBarService.showSnackBar('Account Creation Failure',
          'Server error occured while trying to create Stripe account', true);
    }
  }

  @override
  // ignore: missing_return
  Future<WithdrawModel> getStripeAccountDetails(String accountId) async {
    try {
      final String secretKey = await getSecretKey();
      final res = await http
          .get('https://api.stripe.com/v1/accounts/$accountId', headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      if (res.statusCode != 200) {
        throw Exception('Cannot get the details specified ${res.statusCode}');
      }
      return WithdrawModel.fromMap(jsonDecode(res.body));
    } on Exception catch (e) {
      snackBarService.showSnackBar(
          'Account Creation Failure', e.toString(), true);
    }
  }

  @override
  Future<void> createAccountLink(String accountId) async {
    try {
      final res = await http.post('${AppConstants.Api_Path}/createaccountlink',
          body: {"stripeId": accountId});
      if (res.statusCode != 200 || res.statusCode != 201) {
        throw Exception(
            'Error occurred while creating the account link ${res.statusCode}');
      }
      final data = jsonDecode(res.body);
      final accountLink = data['data']['account_link'];
      if (accountLink != null) {
        await _launchUrl(accountLink);
      } else {
        throw Exception('Cannot get url for the account link');
      }
    } on Exception catch (e) {
      snackBarService.showSnackBar(
          'Account Link Creation Failure ', e.toString(), true);
    }
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Cannot launch url in the browser');
    }
  }

  ///* make sure the amount is valid
  @override
  Future<void> withdraw(String accountId, double amount) async {
    try {
      final res = await http.post('${AppConstants.Api_Path}/withdraw', body: {
        "stripeId": accountId,
        "email": firebaseAuth.currentUser.email,
        "userId": firebaseAuth.currentUser.uid,
        "amount": amount * 100
      });
      if (res.statusCode != 200 || res.statusCode != 201) {
        throw Exception(
            'Error occurred while creating the account link ${res.statusCode}');
      }
      snackBarService.showSnackBar(
          'Withdraw', 'Your payout was success', false);
    } catch (e) {
      snackBarService.showSnackBar(
          'Account Link Creation Failure ', e.toString(), true);
    }
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

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:newpostman1/features/withdraw/data/models/withdrawModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class WithdrawDataSource {
  Future<void> createStripeConnectedAccount();
  Future<WithdrawModel> getStripeAccountDetails(String stripeId);
  Future<void> createAccountLink(String accountId);
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
      final String secretKey = await getSecretKey();

      final res = await http.post('https://api.stripe.com/v1/accounts', body: {
        "type": "express",
        "email": firebaseAuth.currentUser.email,
        "capabilities[transfers][requested]": 'true',
        'settings[payouts][schedule][interval]': 'manual'
      }, headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      });

      if (res.statusCode != 200) {
        throw Exception(
            'Cannot create and account ${res.statusCode.toString() + res.reasonPhrase.toString()}');
      }
      final resp = jsonDecode(res.body);
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser.email)
          .update({
        'stripeId': resp['id'].toString(),
      });
      await createAccountLink(resp['id'].toString());
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
      final String secretKey = await getSecretKey();
      final res =
          await http.post('https://api.stripe.com/v1/account_links', headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      }, body: {
        'account': accountId,
        'refresh_url':
            'https://newpostman1.page.link/?link=https://www.example.com/submitDetails?type%refresh&apn=com.exzitan.newpostman1',
        'return_url':
            'https://newpostman1.page.link/?link=https://www.example.com/submitDetails?type%3Dreturn&apn=com.exzitan.newpostman1',
        'type': 'account_onboarding'
      });
      if (res.statusCode != 200) {
        throw Exception(
            'Error occurred while creating the account link ${res.statusCode}');
      }
      final data = jsonDecode(res.body);
      if (data['url'] != null) {
        if (await canLaunch(data['url'])) {
          await launch(data['url']);
        } else {
          throw Exception('Cannot launch url in the browser');
        }
      } else {
        throw Exception('Cannot get url for the account link');
      }
    } on Exception catch (e) {
      snackBarService.showSnackBar(
          'Account Link Creation Failure ', e.toString(), true);
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
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:uuid/uuid.dart';

import 'ItenaryService.dart';

class ItenaryServiceImpl extends ItenaryService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  @override
  Future<void> postItenary(ItenaryModel itenaryModel) async {
    try {
      await firebaseFirestore.collection("itineraries").add({
        'data': itenaryModel.toJson(),
        'dateAdded': FieldValue.serverTimestamp(),
        'email': Hive.box('user').get('email'),
        'departureDate': itenaryModel.details.departureLocation.dateTime
      }).then((value) {
        Get.off(ThankYouWidget());
        Future.delayed(Duration(milliseconds: 500)).then((value) {
          snackBarService.showSnackBar(
              "Success", "Your itinerary posted successfully", false);
        });
      });
    } on PlatformException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e, true);
    }
  }

  @override
  Future<void> postFlightItenary(
      ItenaryModel itenaryModel, File ticketFile) async {
    print("first upload the flight ticket");

    try {
      final String uuid = Uuid().v1();

      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('${Hive.box('user').get('email')}/tickets/$uuid');

      StorageUploadTask uploadTask = storageReference.putFile(
        ticketFile,
        StorageMetadata(
          contentType: 'image',
          customMetadata: <String, String>{'file': 'image'},
        ),
      );
      await uploadTask.onComplete;
      print('Flight ticket  Uploaded');
      String url = await storageReference.getDownloadURL();
      if (itenaryModel.details.flightDetailsModel != null) {
        itenaryModel.details.flightDetailsModel.ticketUrl = url;
        postItenary(itenaryModel);
      } else {
        //TODO implement the case for here
      }
    } on PlatformException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e, true);
    }
  }
}

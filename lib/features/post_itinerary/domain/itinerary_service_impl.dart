import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:uuid/uuid.dart';

import 'itinerary_service.dart';

class ItenaryServiceImpl extends ItenaryService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  @override
  Future<void> postItinerary(ItineraryModel itenaryModel) async {
    try {
      ///We add the [`departureDate`] ,[`email`] , [`dateAdded`] fields
      ///to simplify the querying of [`itineraries`]
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
  Future<void> postFlightItinerary(
      ItineraryModel itenaryModel, File ticketFile) async {
    print("first upload the flight ticket");

    try {
      ///This is the id of the image
      final String uuid = Uuid().v1();

      ///We create a firebase storage reference
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('${Hive.box('user').get('email')}/tickets/$uuid');

      ///[`Task`] of uploading the image
      StorageUploadTask uploadTask = storageReference.putFile(
        ticketFile,
        StorageMetadata(
          contentType: 'image',
          customMetadata: <String, String>{'file': 'image'},
        ),
      );
      await uploadTask.onComplete;
      print('Flight ticket  Uploaded');

      ///We store the image url here
      String url = await storageReference.getDownloadURL();
      if (itenaryModel.details.flightDetailsModel != null) {
        ///If the [`flight details`] are there we add the [`ticketUrl`]
        itenaryModel.details.flightDetailsModel.ticketUrl = url;
        postItinerary(itenaryModel);
      } else {
        ///If the [`flight details`] are there null we stop the process
        snackBarService.goBackAfterTimePeriod(
            "Error occured", "Please try again", true);
        return;
      }
    } on PlatformException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e, true);
    }
  }
}

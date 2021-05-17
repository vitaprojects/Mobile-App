import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:newpostman1/features/home/presentation/home_view.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/post_errand/data/RunErrandModel.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/services/LocationService.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:uuid/uuid.dart';

class ErrandServiceImpl extends ErrandService {
  final firebaseFireStore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  final LocationService locationService = locator<LocationService>();
  @override
  Future<void> postAvailablityForErrand() async {
    try {
      LocationData locationData = await locationService.getCurrentLocation();
      if (locationData == null) {
        return;
      }
      RunErrandModel runErrandModel = RunErrandModel(
        dateTime: DateTime.now(),
        latitude: locationData.latitude,
        longitude: locationData.longitude,
        postmanEmail: Hive.box('user').get('email'),
        type: 0, //Type equals to 0 means this is availability for errand
      );
      await firebaseFireStore
          .collection("errands")
          .add(runErrandModel.toJson())
          .then((value) {
        snackBarService.showSnackBar("You are now available",
            "You are now available for local errands", false);
      });
    } on PlatformException catch (e) {
      snackBarService.showSnackBar("Error occured", e.message, true);
    } catch (e) {
      snackBarService.showSnackBar("Error occured", e, true);
    }
  }

  @override
  Future<void> postErrand(PostErrandModel postErrandModel) async {
    try {
      await firebaseFireStore
          .collection("errands")
          .add(postErrandModel.toJson())
          .then((value) {
        Get.off(ThankYouWidget(
          typeOfThankYou: 2,
        ));
        Future.delayed(Duration(milliseconds: 500)).then((value) {
          snackBarService.showSnackBar(
              "Errand posted", "Your errand posted successfully", false);
        });
      });
    } on PlatformException catch (e) {
      // Get.offAll(homep)
      Get.offAll(HomePage());
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        snackBarService.showSnackBar("Error occured", e.message, true);
      });
    } catch (e) {
      Get.offAll(HomePage());
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        snackBarService.showSnackBar("Error occured", e.toString(), true);
      });
    }
  }

  @override
  Future<void> uploadImagesOftheErrand(
      List<File> images, PostErrandModel postErrandModel) async {
    List<String> imageUrls = [];
    try {
      for (var i = 0; i < images.length; i++) {
        final String uuid = Uuid().v1();

        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('${Hive.box('user').get('email')}/errands/$uuid');

        StorageUploadTask uploadTask = storageReference.putFile(
          images[i],
          StorageMetadata(
            contentType: 'image',
            customMetadata: <String, String>{'file': 'image'},
          ),
        );
        await uploadTask.onComplete;
        print('errand image  Uploaded');
        String url = await storageReference.getDownloadURL();
        imageUrls.add(url);
      }

      postErrandModel.images = imageUrls;

      postErrand(postErrandModel);
    } on PlatformException catch (e) {
      Get.offAll(HomePage());
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        snackBarService.showSnackBar("Error occured ", e.message, true);
      });
      // snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } catch (e) {
      Get.offAll(HomePage());
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        snackBarService.showSnackBar("Error occured", e.toString(), true);
      });
      // snackBarService.goBackAfterTimePeriod("Error occured", e, true);
    }
  }
}

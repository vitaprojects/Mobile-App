import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/home/presentation/home_view.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'dart:io';

import 'package:newpostman1/features/send_package/domain/services/send_package_service.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:uuid/uuid.dart';

class SendPackageServiceImpl extends SendPackageService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  @override
  Future<void> addDataAboutSendPackage(PackageModel packageModel) async {
    FullPackageModel fullPackageModel = FullPackageModel(
      datePosted: DateTime.now(),
      packageModel: packageModel,
      postedBy: Hive.box("user").get('email'),
      status: 0,
    );

    try {
      await firebaseFirestore
          .collection('packages')
          .add(fullPackageModel.toJson())
          .then((value) {
        Get.offAll(HomePage());

        Future.delayed(Duration(milliseconds: 500)).then((value) {
          snackBarService.showSnackBar(
              "Success", "Your package posted successfully", false);
        });
      });
    } on PlatformException catch (e) {
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
  Future<void> uploadImagesOfthePackage(
      List<File> images, PackageModel packageModel) async {
    List<String> imageUrls = [];
    try {
      for (var i = 0; i < images.length; i++) {
        final String uuid = Uuid().v1();

        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('${Hive.box('user').get('email')}/packages/$uuid');

        StorageUploadTask uploadTask = storageReference.putFile(
          images[i],
          StorageMetadata(
            contentType: 'image',
            customMetadata: <String, String>{'file': 'image'},
          ),
        );
        await uploadTask.onComplete;
        print('Package image  Uploaded');
        String url = await storageReference.getDownloadURL();
        imageUrls.add(url);
      }

      packageModel.images = imageUrls;

      addDataAboutSendPackage(packageModel);
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

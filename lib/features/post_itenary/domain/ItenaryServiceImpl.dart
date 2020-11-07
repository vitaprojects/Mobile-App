import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:newpostman1/useful/service_locator.dart';

import 'ItenaryService.dart';

class ItenaryServiceImpl extends ItenaryService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  @override
  Future<void> postItenary(ItenaryModel itenaryModel) async {
    try {
      await firebaseFirestore.collection("itineraries").add({
        'data': itenaryModel.toJson(),
        'date': FieldValue.serverTimestamp()
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
}

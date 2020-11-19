import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

class RespondToEventsServiceImpl extends RespondToEventsService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  @override
  Future<void> respondToTheRequestOfClient(
      int responseType, String requestDocId) async {
    if (responseType == 1) {
      //then the postman wants to accept the request of the buyer
    } else {}
  }

  @override
  Future<void> cancelRequest(String docId) async {
    print("cancel user request");
    try {
      await firebaseFirestore
          .collection('requests')
          .doc(docId)
          .update({'hasSeenbyPostman': true, 'status': -1}).then((value) {
        snackBarService.showSnackBar(
            "Success", "Request cancelled successfully", false);
      });
    } on PlatformException catch (e) {
      snackBarService.showSnackBar(
          "Error occured", "Error occured while cancelling the request", true);
    } catch (e) {
      snackBarService.showSnackBar(
          "Error occured", "Error occured while cancelling the request", true);
    }
  }

  @override
  Future<PackageModel> getPackageDetails(String docId) async {
    PackageModel packageModel;

    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection("packages").doc(docId).get();

    packageModel =
        PackageModel.fromJson(documentSnapshot.data()['packageModel']);

    return packageModel;
  }

  @override
  Future<void> sendOfferForThePackageToTheClient(
      String requestId, double offerAmount) async {
    try {
      await firebaseFirestore.collection('requests').doc(requestId).update({
        'hasSeenbyPostman': true,
        'postmanOffer': offerAmount,
        'status': 1,
      }).then((value) {
        snackBarService.showSnackBar(
            "Success", "Your offer sent successfully to the client", false);
      });
    } on PlatformException catch (e) {
      snackBarService.showSnackBar("Error occured", e.message, true);
    } catch (e) {
      snackBarService.showSnackBar("Error occured", e.toString(), true);
    }
  }
}

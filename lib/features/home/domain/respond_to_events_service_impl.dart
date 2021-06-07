import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
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
        Get.back();
        Future.delayed(Duration(milliseconds: 500)).then((value) {
          snackBarService.showSnackBar(
              "Success", "Your offer sent successfully to the client", false);
        });
      });
    } on PlatformException catch (e) {
      snackBarService.showSnackBar("Error occured", e.message, true);
    } catch (e) {
      snackBarService.showSnackBar("Error occured", e.toString(), true);
    }
  }

  @override
  Future<void> respondTotheOfferOfPostman(
      bool acceptOffer, RequestModel requestModel) async {
    //if the user is going to reject the order
    //we have to change the status of the request to -2 and we have to set hasseenbyuser to true

    if (acceptOffer == false) {
      await firebaseFirestore
          .collection('requests')
          .doc(requestModel.requestId)
          .update({
        'status': -2,
        'hasSeenbyUser': true,
      }).then((value) {
        snackBarService.showSnackBar(
            "Success", "Offer rejected successfully", false);
      });
    } else {
      try {
        await firebaseFirestore
            .collection('requests')
            .doc(requestModel.requestId)
            .update({
          'status': 2,
          'hasSeenbyUser': true,
        }).then((value) {
          snackBarService.showSnackBar(
              "Success", "Offer accepted successfully", false);
        });

        //now we have to create a order also

        //we have to make the package unavaiable by changing its status

        await firebaseFirestore
            .collection('packages')
            .doc(requestModel
                .packageDocID) //we have to make the pacakge unavailbe
            .update({'status': 1});

        //TODO fix notifying the postman about the new order

        OrderModel orderModel = OrderModel(
          postmanFee: requestModel.postmanOffer,
          pacakgeDocId: requestModel.packageDocID,
          postmanEmail: requestModel.postman,
          statusOftheOrder: 0, //in the beggining of te order the status is 0
          tipAmount: 0, //in the begniing we are not paying the tip
          type: 0, //because this is a order of a pacakge
          userEmail: Hive.box('user').get('email').toLowercase(),
        );

        await firebaseFirestore.collection('orders').add(orderModel.toJson());
      } catch (e) {
        snackBarService.showSnackBar(
            "Error occured", "Error occured while accepting order", true);
      }
    }
  }

  @override
  Future<PostErrandModel> getErrandDetails(String docid) async {
    PostErrandModel postErrandModel;

    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection("errands").doc(docid).get();

    postErrandModel = PostErrandModel.fromJson(documentSnapshot.data());

    return postErrandModel;
  }

  @override
  Future<void> respondToErrandOfferOfTheClient(
      RequestModel requestModel) async {
    //this is used to accept the errand request of the client

    await firebaseFirestore
        .collection('requests')
        .doc(requestModel.requestId)
        .update({
      'status': 1,
      'hasSeenbyPostman': true,
    }).then((value) {
      snackBarService.showSnackBar(
          "Success", "Offer accepted successfully", false);
    });

    //TODO notfy the user about this

    //we have to change the status of the errand to make it unavailable
    await firebaseFirestore
        .collection('errands')
        .doc(requestModel.packageDocID) //TODO complete this ordrmodel
        .update(
      {'status': 1},
    );
  }
}

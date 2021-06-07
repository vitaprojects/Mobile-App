import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/home/presentation/home_view.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

import 'load_package_or_errand_data.dart';

class LoadPackageOrErrandDataImpl extends LoadPackageOrErrandData {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackbarService = locator<SnackBarService>();
  @override
  Future loadPackageOrErrandDataWhenIdIsGiven(String docId, int type) async {
    if (type == 1) {
      DocumentSnapshot documentSnapshot =
          await firebaseFirestore.collection("packages").doc(docId).get();

      FullPackageModel fullPackageModel =
          FullPackageModel.fromJson(documentSnapshot.data());

      return fullPackageModel;
    } else {
      DocumentSnapshot documentSnapshot =
          await firebaseFirestore.collection("errands").doc(docId).get();

      PostErrandModel postErrandModel =
          PostErrandModel.fromJson(documentSnapshot.data());

      return postErrandModel;
    }
  }

  @override
  Future<void> completeOrRejectTheOrder(
      OrderModel orderModel, int responseType, double amountEarned) async {
    //change the order status
    //send a mesasge to the customer
    //if the order is complete add the amount to the postman

    if (responseType == 0) {
      Logger().i("Postman completed the order");
      await firebaseFirestore
          .collection("orders")
          .doc(orderModel.orderID)
          .update({'statusOftheOrder': 1});

      await firebaseFirestore
          .collection("users")
          .doc(orderModel.postmanEmail)
          .update({
        "totalEarnings": FieldValue.increment(amountEarned),
        "completedJobs": FieldValue.increment(1),
        "activeJobs": FieldValue.increment(-1),
      });

      Get.offAll(HomePage());

      await Future.delayed(Duration(seconds: 1));
      snackbarService.showSnackBar(
          "Success", "Order completed successfully", false);
    } else {
      Logger().i("Postman rejected the order");
      await firebaseFirestore
          .collection("orders")
          .doc(orderModel.orderID)
          .update({'statusOftheOrder': 2});

      await firebaseFirestore
          .collection("users")
          .doc(orderModel.postmanEmail)
          .update({
        "rejectedJobs": FieldValue.increment(1),
        "activeJobs": FieldValue.increment(-1),
      });

      Get.offAll(HomePage());

      await Future.delayed(Duration(seconds: 1));
      snackbarService.showSnackBar(
          "Success", "Order rejected successfully", false);
    }
  }
}

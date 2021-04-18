import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:geodesy/geodesy.dart';

import 'find_available_postman_for_package_service.dart';

class FindAvailablePostmanForPackageServiceImpl
    extends FindAvailablePostmanForPackageService {
  final PostedPackagesService postedPackagesService =
      locator<PostedPackagesService>();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();
  @override
  Future<FullPackageModel> getInfoAboutLatestPackage() async {
    //before getting the postmans first we have to get the information about the last package of the user
    //so after getting information about the last package of the user we can use the departure and destination location of thr package to find postman

    // StreamController<List<FullPackageModel>> controller =
    //     StreamController<List<FullPackageModel>>();

    List<FullPackageModel> pacakges =
        await postedPackagesService.getAllPostedPackages().first;

    FullPackageModel latestPackage;
    if (pacakges.length != 0) {
      latestPackage = pacakges.first;
    }

    return latestPackage;
  }

  @override
  Stream<List<ItineraryModel>> getAvailablePostman(
      FullPackageModel packageModel) {
    try {
      Geodesy geodesy = Geodesy();

      LatLng packageLocation = LatLng(
          packageModel.packageModel.dLocation.latitude,
          packageModel.packageModel.dLocation.longitude);

      Query query = buildQuery(
        collection: firebaseFirestore.collection('itineraries'),
        constraints: [
          QueryConstraint(
              field: 'departureDate', isGreaterThanOrEqualTo: DateTime.now()),
        ],
      );
      return getDataFromQuery(
          query: query,
          mapper: (eventDoc) {
            var itenaryModel = ItineraryModel.fromJson(eventDoc.data()['data']);
            return itenaryModel;
          },
          clientSidefilters: [
            (ItineraryModel itenary) =>
                geodesy.distanceBetweenTwoGeoPoints(
                    packageLocation,
                    LatLng(itenary.details.departureLocation.latitude,
                        itenary.details.departureLocation.longitude)) <
                5000,
            (ItineraryModel itenary) =>
                itenary.details.email !=
                Hive.box('user').get(
                    'email'), //we have to remove the current user's itenaries
          ] // only future events
          // orderComparer: (event1, event2) => event1.name.compareTo(event2.name)
          );
    } on Exception catch (ex) {
      print(ex);
    }
    return null;
  }

  @override
  Future<void> sendRequestForPostman(
      FullPackageModel packageModel, String emailOfPostman) async {
    print("send request");

    //create a document reference first
    DocumentReference requestDocumentReference =
        FirebaseFirestore.instance.collection('users').doc();

    RequestModel requestModel = RequestModel(
      date: DateTime.now(),
      hasSeenbyPostman: false,
      hasSeenbyUser: false,
      postman: emailOfPostman,
      requestId: requestDocumentReference.id,
      packageDocID: packageModel.docId,
      status: 0,
      type: 0, //
      user: Hive.box('user').get('email'),

      ///When the customer is sending the request there is no offer so we set the value to 0
      postmanOffer: 0,
    );

    await firebaseFirestore
        .collection('requests')
        .doc(requestDocumentReference.id)
        .set(requestModel.toJson())
        .then((value) {
      Get.back();
      Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
        snackBarService.showSnackBar(
            "Success", "Your request sent for the postman successfully", false);
      });
    });
  }
}

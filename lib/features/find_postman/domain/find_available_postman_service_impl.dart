import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:geodesy/geodesy.dart';

import 'find_available_postman_service.dart';

class FindAvailablePostmanServiceImpl extends FindAvailablePostmanService {
  final PostedPackagesService postedPackagesService =
      locator<PostedPackagesService>();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<FullPackageModel> getInfoAboutLatestPackage() async {
    //before getting the postmans first we have to get the information about the last package of the user
    //so after getting information about the last package of the user we can use the departure and destination location of thr package to find postman

    // StreamController<List<FullPackageModel>> controller =
    //     StreamController<List<FullPackageModel>>();

    List<FullPackageModel> pacakges =
        await postedPackagesService.getAllPostedPackages().first;

    FullPackageModel latestPackage = pacakges.first;

    return latestPackage;
  }

  @override
  Stream<List<ItenaryModel>> getAvailablePostman(
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
            var itenaryModel = ItenaryModel.fromJson(eventDoc.data()['data']);
            return itenaryModel;
          },
          clientSidefilters: [
            (ItenaryModel itenary) =>
                geodesy.distanceBetweenTwoGeoPoints(
                    packageLocation,
                    LatLng(itenary.details.departureLocation.latitude,
                        itenary.details.departureLocation.longitude)) <
                5000,
            (ItenaryModel itenary) =>
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
}

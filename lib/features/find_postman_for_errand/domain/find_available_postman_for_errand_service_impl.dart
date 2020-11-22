import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:geodesy/geodesy.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/My%20errands/domain/posted_errands_service.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';

import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

import 'find_available_postman_for_errand_service.dart';

class FindAvailablePostmanForErrandServiceImpl
    extends FindAvailablePostmanForErrandService {
  final PostedErrandsService postedErrandsService =
      locator<PostedErrandsService>();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final SnackBarService snackBarService = locator<SnackBarService>();

  @override
  Stream<List<ItenaryModel>> getAvailablePostman(
      PostErrandModel postErrandModel) {
    try {
      Geodesy geodesy = Geodesy();

      LatLng errandLocation = LatLng(postErrandModel.pAddress.latitude,
          postErrandModel.pAddress.longitude);

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
                    errandLocation,
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

  @override
  Future<PostErrandModel> getInfoAboutLatestErrand() async {
    List<PostErrandModel> errands =
        await postedErrandsService.getAllPostedErrands().first;

    PostErrandModel latestErrand = errands.first;

    return latestErrand;
  }

  @override
  Future<void> sendRequestForPostman(
      PostErrandModel postErrandModel, String emailOfPostman) async {
    print("send request for the errand");

    print("send request");

    RequestModel requestModel = RequestModel(
      date: DateTime.now(),
      hasSeenbyPostman: false,
      hasSeenbyUser: false,
      postman: emailOfPostman,
      // requestId: packageModel.docId,
      packageDocID: postErrandModel.docId,
      status: 0,
      type: 1, //because this is a errand
      user: Hive.box('user').get('email'),
    );

    await firebaseFirestore
        .collection('requests')
        .add(requestModel.toJson())
        .then((value) {
      Get.back();
      Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
        snackBarService.showSnackBar(
            "Success", "Your request sent for the postman successfully", false);
      });
    });
  }
}

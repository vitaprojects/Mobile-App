import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:newpostman1/features/post_errand/data/RunErrandModel.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/services/LocationService.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

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
        type: 0,
      );
      await firebaseFireStore
          .collection("errands")
          .add({'type': 0, 'date': runErrandModel.toJson()}).then((value) {
        snackBarService.showSnackBar("You are now available",
            "You are now available for local errands", false);
      });
    } on PlatformException catch (e) {
      snackBarService.showSnackBar("Error occured", e.message, true);
    } catch (e) {
      snackBarService.showSnackBar("Error occured", e, true);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

class CustomerRequestForErrandViewModel extends ChangeNotifier {
  final RespondToEventsService respondToEventsService =
      locator<RespondToEventsService>();
  final SnackBarService snackBarService = locator<SnackBarService>();
  RequestModel requestModel; //this is the request that the postman receive

  PostErrandModel postErrandModel; //this will contain data about the package
  bool showErrorMessage = false;

  void initialiseData(RequestModel requestModelReceived) async {
    requestModel = requestModelReceived;

    if (requestModel != null && requestModel.packageDocID != null) {
      postErrandModel = await respondToEventsService
          .getErrandDetails(requestModel.packageDocID);
      if (postErrandModel != null) {
        notifyListeners();
      } else {
        showErrorMessage = true;
      }
    } else {
      print("error occured");
      showErrorMessage = true;
    }
  }

  void showLocationOnMaps(int i) async {
    //this method is used to load the location of deprture and destion on maps
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    if (i == 0) {
      //load the pickup location on maps
      if (postErrandModel.pAddress?.latitude != null &&
          postErrandModel.pAddress?.longitude != null) {
        await availableMaps.first.showMarker(
          coords: Coords(postErrandModel.pAddress.latitude,
              postErrandModel.pAddress.longitude),
          title: "Pickup Location",
        );
      } else {
        snackBarService.showSnackBar(
            "Error occured", "Error occured while launching maps", true);
      }
    } else if (i == 1) {
      //load the departure location on maps
      if (postErrandModel.dAddress?.latitude != null &&
          postErrandModel.dAddress?.longitude != null) {
        await availableMaps.first.showMarker(
          coords: Coords(postErrandModel.dAddress.latitude,
              postErrandModel.dAddress.longitude),
          title: "Destination Location",
        );
      } else {
        snackBarService.showSnackBar(
            "Error occured", "Error occured while launching maps", true);
      }
    }
  }

  void sendOffer() {
    print("accept errand offer of the client");

    if (requestModel.requestId != null) {
      respondToEventsService.respondToErrandOfferOfTheClient(requestModel);
    } else {
      snackBarService.showSnackBar(
          "Eror occured", "Error occured while accepting the offer", true);
    }
  }
}

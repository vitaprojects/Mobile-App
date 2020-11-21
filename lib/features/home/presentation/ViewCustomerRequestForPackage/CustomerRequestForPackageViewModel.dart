import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class CustomerRequestForPackageViewModel extends ChangeNotifier {
  final RespondToEventsService respondToEventsService =
      locator<RespondToEventsService>();
  final SnackBarService snackBarService = locator<SnackBarService>();
  RequestModel requestModel; //this is the request that the postman receive

  PackageModel packageModel; //this will contain data about the package
  bool showErrorMessage = false;

  void initialiseData(RequestModel requestModelReceived) async {
    requestModel = requestModelReceived;

    if (requestModel != null && requestModel.packageDocID != null) {
      packageModel = await respondToEventsService
          .getPackageDetails(requestModel.packageDocID);
      if (packageModel != null) {
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
      if (packageModel.dLocation?.latitude != null &&
          packageModel.dLocation?.longitude != null) {
        await availableMaps.first.showMarker(
          coords: Coords(packageModel.dLocation.latitude,
              packageModel.dLocation.longitude),
          title: "Departure Location",
        );
      } else {
        snackBarService.showSnackBar(
            "Error occured", "Error occured while launching maps", true);
      }
    } else if (i == 1) {
      //load the departure location on maps
      if (packageModel.fLocation?.latitude != null &&
          packageModel.fLocation?.longitude != null) {
        await availableMaps.first.showMarker(
          coords: Coords(packageModel.fLocation.latitude,
              packageModel.fLocation.longitude),
          title: "Destination Location",
        );
      } else {
        snackBarService.showSnackBar(
            "Error occured", "Error occured while launching maps", true);
      }
    }
  }

  TextEditingController offerTsextEditingController =
      TextEditingController(); //this is added to get the offer amount the user added

  void sendOffer() {
    if (offerTsextEditingController.text.isNotEmpty &&
        isFloat(offerTsextEditingController.text)) {
      if (requestModel.requestId != null) {
        respondToEventsService.sendOfferForThePackageToTheClient(
            requestModel.requestId,
            double.parse(offerTsextEditingController.text));
      }
    } else {
      snackBarService.showSnackBar("Input error",
          "Please enter a valid value as the offer amount", true);
    }
  }
}

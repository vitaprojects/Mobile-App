import 'dart:io';

import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/ongoing-orders/domain/load_package_or_errand_data.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

class OngoingOrderViewModel extends ChangeNotifier {
  OrderModel currentOrderModel;
  double currentIncomeFromTheORder = 0;
  LoadPackageOrErrandData loadPackageOrErrandData =
      locator<LoadPackageOrErrandData>();

  final DialogService dialogService = locator<DialogService>();

  ///If the order type is a package type we assign a value to this
  FullPackageModel fullPackageModel;

  ///If the ordrr
  PostErrandModel postErrandModel;

  ///This is used to load the departure location model
  LocationModel departureLocationModel;

  ///This is used to load the destination location model
  LocationModel destinationLocationModel;

  ///We keep this flag to check whether the data is loaded or not
  bool isDataLoaded = false;

  initializeData(OrderModel orderModel) {
    currentOrderModel = orderModel;
    currentIncomeFromTheORder = orderModel.subtotal * 0.8;
    loadData();
    notifyListeners();
  }

  ///We use this function to load the [`package`] or the [`errand`] data

  loadData() async {
    try {
      if (currentOrderModel.type == 1) {
        ///type equals to 1 means we have to load the data about a package
        fullPackageModel =
            await loadPackageOrErrandData.loadPackageOrErrandDataWhenIdIsGiven(
                currentOrderModel.pacakgeDocId, 1);

        departureLocationModel = fullPackageModel.packageModel.dLocation;
        destinationLocationModel = fullPackageModel.packageModel.fLocation;
      } else {
        ///type equals to 0 means we have to load the data about a package

        postErrandModel =
            await loadPackageOrErrandData.loadPackageOrErrandDataWhenIdIsGiven(
                currentOrderModel.pacakgeDocId, 0);

        departureLocationModel = postErrandModel.pAddress;
        destinationLocationModel = postErrandModel.dAddress;
      }

      isDataLoaded = true;
      notifyListeners();
    } catch (e) {
      isDataLoaded = false;
      notifyListeners();
    }
  }

  ///This function is used to load google map when the coordinates are given
  launchMap(LocationModel locationModel) {
    MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(locationModel.latitude, locationModel.longitude));
  }

  ///This function is used to accept or reject the order
  ///
  ///if responseType is equal to [`0`] it means complete the order
  ///if it is equal to [`1`] it means reject the order
  completeOrRejectTheOrder(int responseType) async {
    var response = await dialogService.showConfirmationDialog(
      title: responseType == 0 ? "Complete the order" : "Reject the order",
      description:
          "Are you sure you want to ${responseType == 0 ? 'Complete' : 'Reject'} this order",
      cancelTitle: "NO",
      confirmationTitle: "YES",
      dialogPlatform:
          (Platform.isIOS) ? DialogPlatform.Cupertino : DialogPlatform.Material,
    );

    if (response != null && (response.confirmed == true)) {
      loadPackageOrErrandData.completeOrRejectTheOrder(
          currentOrderModel, responseType, currentIncomeFromTheORder);
    }
  }
}

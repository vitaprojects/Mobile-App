import 'package:flutter/material.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/ongoing-orders/domain/load_package_or_errand_data.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class OngoingOrderViewModel extends ChangeNotifier {
  OrderModel currentOrderModel;
  double currentIncomeFromTheORder = 0;
  LoadPackageOrErrandData loadPackageOrErrandData =
      locator<LoadPackageOrErrandData>();

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
}

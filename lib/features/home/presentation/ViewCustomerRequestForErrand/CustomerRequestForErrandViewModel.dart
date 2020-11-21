import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman_for_errand/domain/find_available_postman_for_errand_service.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AvailablePostmanForErrandViewModel extends ChangeNotifier {
  PostErrandModel postErrandModel;
  final FindAvailablePostmanForErrandService findAvailablePostmanService =
      locator<FindAvailablePostmanForErrandService>();

  final DialogService dialogService = locator<DialogService>();

  initialize() async {
    postErrandModel =
        await findAvailablePostmanService.getInfoAboutLatestErrand();
    //print(postErrandModel.datePosted);
    notifyListeners();
  }

  showDialogToSendRequest(context, String postmanEmail) async {
    print("send request for postman");

    var response = await dialogService.showConfirmationDialog(
      title: "Select postman",
      description: "Are you sure you want to select this postman",
      cancelTitle: "NO",
      confirmationTitle: "YES",
      dialogPlatform:
          (Platform.isIOS) ? DialogPlatform.Cupertino : DialogPlatform.Material,
    );

    if (response.confirmed) {
      // Do some confirmation action here.
      print("send request for this postman");
      findAvailablePostmanService.sendRequestForPostman(
          postErrandModel, postmanEmail);
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newpostman1/features/find_postman_for_package/domain/find_available_postman_for_package_service.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { base, form }

class AvailablePostmanViewModel extends ChangeNotifier {
  FullPackageModel latestPackage;
  final FindAvailablePostmanForPackageService findAvailablePostmanService =
      locator<FindAvailablePostmanForPackageService>();

  final DialogService dialogService = locator<DialogService>();

  initialize() async {
    latestPackage =
        await findAvailablePostmanService.getInfoAboutLatestPackage();
    //print(latestPackage.datePosted);
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
          latestPackage, postmanEmail);
    }
  }
}

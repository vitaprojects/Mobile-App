import 'package:flutter/material.dart';
import 'package:newpostman1/observables/user_data_observable.dart';
import 'package:newpostman1/useful/service_locator.dart';

class DrawerWidgetViewModel extends ChangeNotifier {
  final UserData userData = locator<UserData>();
  double totalEarnings = 0;
  listenToChangesInUserModel() {
    userData.userModel.listen((v) {
      if (v != null) {
        if (v.totalEarnings != 0) {
          totalEarnings = v.totalEarnings;
          notifyListeners();
        }
      }
    });
  }
}

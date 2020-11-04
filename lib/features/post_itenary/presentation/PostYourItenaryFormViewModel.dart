import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostYourItenaryFormViewModel extends ChangeNotifier {
  Color chipColor = Colors.white;
  int _travelType;
  int _driverPassengerOrCon; //the type of the user
  bool _canPickUp; //whether the user can pcikup or not
  bool _canDeliver;

  int get getTravelType => _travelType;

  setTravelType(int val) {
    _travelType = val;
    notifyListeners();
  }

  setDriverPassengerOrCon(int val) {
    _driverPassengerOrCon = val;
    notifyListeners();
  }

  setCanPickUp(bool val) {
    _canPickUp = val;
    notifyListeners();
  }

  setCanDeliver(bool val) {
    _canDeliver = val;
    notifyListeners();
  }
}

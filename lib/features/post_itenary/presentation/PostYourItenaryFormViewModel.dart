import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PostYourItenaryFormViewModel extends ChangeNotifier {
  Color chipColor = Colors.white;
  int _travelType;
  int _driverPassengerOrCon; //the type of the user
  bool _canPickUp; //whether the user can pcikup or not
  bool _canDeliver;

  //vehicle details
  //this list will contain the text editing controllers for the vehicle details
  List<TextEditingController> _vehicleDetailsControllers =
      List.filled(3, TextEditingController());

  TextEditingController get vehicleIdentification =>
      _vehicleDetailsControllers[0];

  TextEditingController get transportCompany => _vehicleDetailsControllers[0];

  TextEditingController get licencePlateNumber => _vehicleDetailsControllers[0];

  //this section will contain about vehicle details

  //this section will contain the setters and getters for departure
  List<TextEditingController> _depatureDetailsControllers =
      List.filled(4, TextEditingController());

  TextEditingController get getDepartureDateAndTime =>
      _depatureDetailsControllers[0];

  TextEditingController get getDepartingLocation =>
      _depatureDetailsControllers[1];

  TextEditingController get getDepartureTerminal =>
      _depatureDetailsControllers[2];

  TextEditingController get getDepartingAirport =>
      _depatureDetailsControllers[3];

  setCanPickUp(bool val) {
    _canPickUp = val;
    notifyListeners();
  }

//

//this section will contain the setters and getters for destionation
  List<TextEditingController> _destinationeDetailsControllers =
      List.filled(4, TextEditingController());

  TextEditingController get getDestinationDateAndTime =>
      _destinationeDetailsControllers[0];

  TextEditingController get getDestinationLocation =>
      _destinationeDetailsControllers[1];

  TextEditingController get getDestinationTerminal =>
      _destinationeDetailsControllers[2];

  TextEditingController get getDestinationAirport =>
      _destinationeDetailsControllers[3];

  setCanDeliver(bool val) {
    _canDeliver = val;
    notifyListeners();
  }

//

//this section will contain details about the plane travel
  List<TextEditingController> _flightDetailsControllers =
      List.filled(2, TextEditingController());

  File _flightTicket;

  File get getflightTicket => _flightTicket;

  TextEditingController get getFlightNumber => _flightDetailsControllers[0];

  TextEditingController get getAirlineNumber => _flightDetailsControllers[1];
  final picker = ImagePicker();

  Future getImage(int type) async {
    //this function is used to  upload pictures
    PickedFile pickedFile;
    if (type == 0) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      _flightTicket = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Add your image',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              activeControlsWidgetColor: Colors.blue,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
    }

    if (_flightTicket != null) {
      notifyListeners();
    }
  }

  removeImage() {
    _flightTicket = null;
    notifyListeners();
  }

  ///

  int get getTravelType => _travelType;

  setTravelType(int val) {
    _travelType = val;
    notifyListeners();
  }

  setDriverPassengerOrCon(int val) {
    _driverPassengerOrCon = val;
    notifyListeners();
  }
}

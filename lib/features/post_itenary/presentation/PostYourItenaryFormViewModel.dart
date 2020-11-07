import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryDetailsModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/features/post_itenary/data/VehicleDetailsModel.dart';
import 'package:newpostman1/features/post_itenary/data/travelTypes/FlightDetailsModel.dart';
import 'package:newpostman1/features/post_itenary/domain/ItenaryService.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
// import 'package:newpostman1/services/snackbar_service.dart';
// import 'package:stacked_services/stacked_services.dart';
import 'package:newpostman1/useful/service_locator.dart';

class PostYourItenaryFormViewModel extends ChangeNotifier {
  Color chipColor = Colors.white;
  SnackBarService snackBarService = locator<SnackBarService>();
  ItenaryService itenaryService = locator<ItenaryService>();

  int _travelType;
  int _driverPassengerOrCon; //the type of the user
  bool _canPickUp; //whether the user can pcikup or not
  bool _canDeliver;

  //vehicle details
  //this list will contain the text editing controllers for the vehicle details
  List<TextEditingController> _vehicleDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  TextEditingController get vehicleIdentification =>
      _vehicleDetailsControllers[0];

  TextEditingController get transportCompany => _vehicleDetailsControllers[1];

  TextEditingController get licencePlateNumber => _vehicleDetailsControllers[2];

  //this section will contain about vehicle details

  //this section will contain the setters and getters for departure
  List<TextEditingController> _depatureDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  TextEditingController get getDepartureDateAndTime =>
      _depatureDetailsControllers[0];

  LocationModel departurelocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );

  clearDepartingLocation() {
    departurelocationModel.latitude = departurelocationModel.longitude =
        departurelocationModel.address = null;

    notifyListeners();
  }

  setValuesForDepartingLocation(
      double latitude, double longitude, String address) {
    departurelocationModel.latitude = latitude;
    departurelocationModel.longitude = longitude;
    departurelocationModel.address = address;

    notifyListeners();
  }

  TextEditingController get getDepartureTerminal =>
      _depatureDetailsControllers[1];

  TextEditingController get getDepartingAirport =>
      _depatureDetailsControllers[2];

  setCanPickUp(bool val) {
    _canPickUp = val;
    notifyListeners();
  }

//TODO when the travel type change the current values should change accordingly
//

//this section will contain the setters and getters for destination
  List<TextEditingController> _destinationeDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  TextEditingController get getDestinationDateAndTime =>
      _destinationeDetailsControllers[0];

  // TextEditingController get getDestinationLocation =>
  //     _destinationeDetailsControllers[1];
  LocationModel destinationlocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );

  clearDestinationLocation() {
    destinationlocationModel.latitude = destinationlocationModel.longitude =
        destinationlocationModel.address = null;

    notifyListeners();
  }

  setValuesForDestinationLocation(
      double latitude, double longitude, String address) {
    destinationlocationModel.latitude = latitude;
    destinationlocationModel.longitude = longitude;
    destinationlocationModel.address = address;

    notifyListeners();
  }

  TextEditingController get getDestinationTerminal =>
      _destinationeDetailsControllers[1];

  TextEditingController get getDestinationAirport =>
      _destinationeDetailsControllers[2];

  setCanDeliver(bool val) {
    _canDeliver = val;
    notifyListeners();
  }

//

//this section will contain details about the plane travel
  List<TextEditingController> _flightDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

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

  submitForm() {
    bool isValid = false;
    print("validate and submit");
    if (_travelType != null) {
      if (_travelType == 0) {
        if (_driverPassengerOrCon != null) {
          if (validateVehicleIdentification()) {
            if (departureValidation()) {
              if (destinationValidation()) {
                print("all details for bus is valid");
                isValid = true;

                //now we have to prepare the models required

                VehicleDetailsModel vehicleDetailsModel = VehicleDetailsModel(
                  licensePlateNumber: licencePlateNumber.text,
                  transportcompany: transportCompany.text,
                  vehicleId: vehicleIdentification.text,
                  driverPassenderOrCon: _driverPassengerOrCon,
                );

                LocationModel departureLocation = LocationModel(
                  dateTime: DateTime.parse(getDepartureDateAndTime.text),
                  address: departurelocationModel.address,
                  latitude: departurelocationModel.latitude,
                  longitude: departurelocationModel.longitude,
                );

                LocationModel destinationLocation = LocationModel(
                  dateTime: DateTime.parse(getDestinationDateAndTime.text),
                  address: destinationlocationModel.address,
                  latitude: destinationlocationModel.latitude,
                  longitude: destinationlocationModel.longitude,
                );

                ItenaryDetailsModel itenaryDetailsModel = ItenaryDetailsModel(
                  flightDetailsModel: null,
                  vehicleDetailsModel: vehicleDetailsModel,
                  canPickup: false,
                  canDeliver: false,
                  departureLocation: departureLocation,
                  destinationLocation: destinationLocation,
                );

                ItenaryModel itenaryModel = ItenaryModel(
                  dateAdded: DateTime.now(),

                  travelType: _travelType,
                  details: itenaryDetailsModel,
                  // email: Hive.box("user").get('email'),
                );
                Get.off(LoadingPage(text: "Please wait"));
                itenaryService.postItenary(itenaryModel);
              }
            }
          }
        } else {
          snackBarService.showSnackBar(
              "Input error", "Please select your role", true);
          return;
        }
      } else if (_travelType == 3) {
        if (validateFlightDetails()) {
          if (departureValidation()) {
            if (destinationValidation()) {
              print("all details for plane is valid");
              isValid = true;

              //now we have to prepare the models required

              FlightDetailsModel flightDetailsModel = FlightDetailsModel(
                airLineNumber: getAirlineNumber.text,
                flightNumber: getFlightNumber.text,
                ticketUrl: null,
              );

              LocationModel departureLocation = LocationModel(
                  dateTime: DateTime.parse(getDepartureDateAndTime.text),
                  address: departurelocationModel.address,
                  latitude: departurelocationModel.latitude,
                  longitude: departurelocationModel.longitude,
                  airport: getDepartingAirport.text,
                  terminal: getDepartureTerminal.text);

              LocationModel destinationLocation = LocationModel(
                dateTime: DateTime.parse(getDestinationDateAndTime.text),
                address: destinationlocationModel.address,
                latitude: destinationlocationModel.latitude,
                longitude: destinationlocationModel.longitude,
                airport: getDestinationAirport.text,
                terminal: getDestinationTerminal.text,
              );

              ItenaryDetailsModel itenaryDetailsModel = ItenaryDetailsModel(
                  vehicleDetailsModel: null,
                  canPickup: false,
                  canDeliver: false,
                  departureLocation: departureLocation,
                  destinationLocation: destinationLocation,
                  flightDetailsModel: flightDetailsModel);

              ItenaryModel itenaryModel = ItenaryModel(
                dateAdded: DateTime.now(),
                travelType: _travelType,
                details: itenaryDetailsModel,
                // email: Hive.box("user").get('email'),
              );
              Get.off(LoadingPage(text: "Please wait"));
              itenaryService.postFlightItenary(itenaryModel, _flightTicket);
            }
          }
        }
      } else {
        //then the travel type is other
        if (validateVehicleIdentification()) {
          if (departureValidation()) {
            if (destinationValidation()) {
              print("all details for others is valid");
              isValid = true;

              //now we have to prepare the models required

              VehicleDetailsModel vehicleDetailsModel = VehicleDetailsModel(
                licensePlateNumber: licencePlateNumber.text,
                transportcompany: transportCompany.text,
                vehicleId: vehicleIdentification.text,
              );

              LocationModel departureLocation = LocationModel(
                dateTime: DateTime.parse(getDepartureDateAndTime.text),
                address: departurelocationModel.address,
                latitude: departurelocationModel.latitude,
                longitude: departurelocationModel.longitude,
              );

              LocationModel destinationLocation = LocationModel(
                dateTime: DateTime.parse(getDestinationDateAndTime.text),
                address: destinationlocationModel.address,
                latitude: destinationlocationModel.latitude,
                longitude: destinationlocationModel.longitude,
              );

              ItenaryDetailsModel itenaryDetailsModel = ItenaryDetailsModel(
                flightDetailsModel: null,
                vehicleDetailsModel: vehicleDetailsModel,
                canPickup: (_canPickUp != null) ? _canPickUp : false,
                canDeliver: (_canDeliver != null) ? _canDeliver : false,
                departureLocation: departureLocation,
                destinationLocation: destinationLocation,
              );

              ItenaryModel itenaryModel = ItenaryModel(
                dateAdded: DateTime.now(),

                travelType: _travelType,
                details: itenaryDetailsModel,
                // email: Hive.box("user").get('email'),
              );
              Get.off(LoadingPage(text: "Please wait"));
              itenaryService.postItenary(itenaryModel);
            }
          }
        }
      }
    } else {
      snackBarService.showSnackBar(
          "Input error", "Please select the travel type", true);
      return;
    }
    return isValid;
  }

  bool validateFlightDetails() {
    bool isValid = false;
    if (_flightTicket != null) {
      if (getFlightNumber.text.isNotEmpty) {
        if (getAirlineNumber.text.isNotEmpty) {
          isValid = true;
        } else {
          snackBarService.showSnackBar(
              "Input error", "Please enter a valid airline number", true);
        }
      } else {
        snackBarService.showSnackBar(
            "Input error", "Please enter a valid flight number", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Input error", "Please upload a image of the ticket", true);
    }

    return isValid;
  }

  bool validateVehicleIdentification() {
    bool isValid = false;

    if (vehicleIdentification.text.isNotEmpty) {
      if (transportCompany.text.isNotEmpty) {
        if (licencePlateNumber.text.isNotEmpty) {
          isValid = true;
        } else {
          snackBarService.showSnackBar(
              "Input error", "Please enter a valid license plate number", true);
        }
      } else {
        snackBarService.showSnackBar(
            "Input error", "Please select a valid transport company", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Input error", "Please enter valid vehicle identification", true);
    }
    return isValid;
  }

  bool departureValidation() {
    bool isValid = false;
    if (getDepartureDateAndTime.text.isNotEmpty) {
      if (departurelocationModel.latitude != null &&
          departurelocationModel.longitude != null) {
        if (_travelType == 3) {
          if (getDepartureTerminal.text.isNotEmpty &&
              getDepartingAirport.text.isNotEmpty) {
            isValid = true;
          } else {
            snackBarService.showSnackBar("Input error",
                "Please add the departure terminal and airport", true);
          }
        } else {
          isValid = true;
        }
      } else {
        snackBarService.showSnackBar(
            "Input error", "Please select the departure location", true);
      }
    } else {
      snackBarService.showSnackBar("Input error",
          "Please select a valid date and time for departure", true);
    }
    return isValid;
  }

  bool destinationValidation() {
    bool isValid = false;
    if (getDestinationDateAndTime.text.isNotEmpty) {
      if (destinationlocationModel.latitude != null &&
          destinationlocationModel.longitude != null) {
        if (_travelType == 3) {
          if (getDestinationTerminal.text.isNotEmpty &&
              getDestinationAirport.text.isNotEmpty) {
            isValid = true;
          } else {
            snackBarService.showSnackBar("Input error",
                "Please add the destination terminal and airport", true);
          }
        } else {
          isValid = true;
        }
      } else {
        snackBarService.showSnackBar(
            "Input error", "Please select the destination location", true);
      }
    } else {
      snackBarService.showSnackBar("Input error",
          "Please select a valid date and time for destination", true);
    }
    return isValid;
  }
}

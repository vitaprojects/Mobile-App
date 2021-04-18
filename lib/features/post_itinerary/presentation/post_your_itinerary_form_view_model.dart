import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/post_itinerary/data/itinerary_details_model.dart';
import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';
import 'package:newpostman1/features/post_itinerary/data/VehicleDetailsModel.dart';
import 'package:newpostman1/features/post_itinerary/data/travelTypes/FlightDetailsModel.dart';
import 'package:newpostman1/features/post_itinerary/domain/itinerary_service.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

class PostYourItineraryFormViewModel extends ChangeNotifier {
  Color chipColor = Colors.white;
  SnackBarService snackBarService = locator<SnackBarService>();
  ItenaryService itenaryService = locator<ItenaryService>();

  ///The travel type of the [`itinerary`]
  int _travelType;

  ///The type of the user if the user is travelling by bus ([`Driver`],[`Passenger`],[`Conductor`])
  int _driverPassengerOrCon;

  ///whether the user can [`pickup`] or not
  bool _canPickUp;

  ///whether the user can [`deliver`] or not

  bool _canDeliver;

  //!vehicle details
  ///This list will contain the text editing controllers for the [`vehicle details`]
  List<TextEditingController> _vehicleDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  ///This will return the [`textediting controller`] for the [`vehicle identification`] field
  TextEditingController get vehicleIdentification =>
      _vehicleDetailsControllers[0];

  ///This will return the [`textediting controller`] for the [`transport company`] field

  TextEditingController get transportCompany => _vehicleDetailsControllers[1];

  ///This will return the [`textediting controller`] for the [`license plate number`] field

  TextEditingController get licencePlateNumber => _vehicleDetailsControllers[2];

  //!
  //*this section will contain the setters and getters for [`departure`]
  ///This list will contain the text editing controllers for the [`departure details`]

  List<TextEditingController> _depatureDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  ///This is the [`location model`] which contain info about the [`departure location`]

  LocationModel departurelocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );

  ///We use this to [`clear`] the existing data in the [`departure location model`]
  clearDepartingLocation() {
    departurelocationModel.latitude = departurelocationModel.longitude =
        departurelocationModel.address = null;

    notifyListeners();
  }

  ///We use this to [`set`] new values for the [`departure location model`]
  setValuesForDepartingLocation(
      double latitude, double longitude, String address) {
    departurelocationModel.latitude = latitude;
    departurelocationModel.longitude = longitude;
    departurelocationModel.address = address;

    notifyListeners();
  }

  ///This will return the [`textediting controller`] for the [`departure date and time `] field

  TextEditingController get getDepartureDateAndTime =>
      _depatureDetailsControllers[0];

  ///This will return the [`textediting controller`] for the [`departure terminal `] field if the travel type is [`Plane`]

  TextEditingController get getDepartureTerminal =>
      _depatureDetailsControllers[1];

  ///This will return the [`textediting controller`] for the [`departure airport `] field if the travel type is [`Plane`]

  TextEditingController get getDepartingAirport =>
      _depatureDetailsControllers[2];

  ///Set value for the [`canpickup`]
  setCanPickUp(bool val) {
    _canPickUp = val;
    notifyListeners();
  }
  //*

//TODO when the travel type change the current values should change accordingly
//

//!this section will contain the setters and getters for destination
  ///This list will contain the text editing controllers for the [`destination details`]

  List<TextEditingController> _destinationeDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  // TextEditingController get getDestinationLocation =>
  //     _destinationeDetailsControllers[1];
  ///This is the [`location model`] which contain info about the [`destination location`]

  LocationModel destinationlocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );

  ///We use this to [`clear`] the existing data in the [`destination location model`]

  clearDestinationLocation() {
    destinationlocationModel.latitude = destinationlocationModel.longitude =
        destinationlocationModel.address = null;

    notifyListeners();
  }

  ///We use this to [`set`] new values for the [`destination location model`]

  setValuesForDestinationLocation(
      double latitude, double longitude, String address) {
    destinationlocationModel.latitude = latitude;
    destinationlocationModel.longitude = longitude;
    destinationlocationModel.address = address;

    notifyListeners();
  }

  ///This will return the [`textediting controller`] for the [`destination date and time `] field

  TextEditingController get getDestinationDateAndTime =>
      _destinationeDetailsControllers[0];

  ///This will return the [`textediting controller`] for the [`destination terminal `] field if the travel type is [`Plane`]

  TextEditingController get getDestinationTerminal =>
      _destinationeDetailsControllers[1];

  ///This will return the [`textediting controller`] for the [`destination airport `] field if the travel type is [`Plane`]

  TextEditingController get getDestinationAirport =>
      _destinationeDetailsControllers[2];

  ///Set value to [`canDeliver`]
  setCanDeliver(bool val) {
    _canDeliver = val;
    notifyListeners();
  }

//!

  ///This list will contain the text editing controllers for the [`flight details`]

  List<TextEditingController> _flightDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  ///The [`file`] uploaded by the user as the [`flight ticket`]

  File _flightTicket;

  ///This will return the current [`flight ticket`]

  File get getflightTicket => _flightTicket;

  ///This will return the [`textediting controller`] for the [`Flight Number`] field if the travel type is [`Plane`]

  TextEditingController get getFlightNumber => _flightDetailsControllers[0];

  ///This will return the [`textediting controller`] for the [`Airline Number`] field if the travel type is [`Plane`]

  TextEditingController get getAirlineNumber => _flightDetailsControllers[1];

  ///The image picker variable
  final picker = ImagePicker();

  ///This function is used to get the [`image file`] from [`gallery`] or the [`camera`]

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

  ///Remove the flight ticket added by the user
  removeImage() {
    _flightTicket = null;
    notifyListeners();
  }

  ///This will return the current [`travel type`] of the [`itinerary`] of the user

  int get getTravelType => _travelType;

  ///Set the travel type of the [`itinerary`] of the user
  setTravelType(int val) {
    _travelType = val;
    notifyListeners();
  }

  ///Set the [`role`] of the user if he is travelling in a [`Bus`]

  setDriverPassengerOrCon(int val) {
    _driverPassengerOrCon = val;
    notifyListeners();
  }

  ///This will validate the [`input`] added by the user and create the relavant [`models`]
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
                /// This model will contain details about [`bus`]

                VehicleDetailsModel vehicleDetailsModel = VehicleDetailsModel(
                  licensePlateNumber: licencePlateNumber.text,
                  transportcompany: transportCompany.text,
                  vehicleId: vehicleIdentification.text,
                  driverPassenderOrCon: _driverPassengerOrCon,
                );

                ///This will contain details about the [`departure`] location

                LocationModel departureLocation = LocationModel(
                  dateTime: DateTime.parse(getDepartureDateAndTime.text),
                  address: departurelocationModel.address,
                  latitude: departurelocationModel.latitude,
                  longitude: departurelocationModel.longitude,
                );

                ///This will contain details about the [`destination`] location

                LocationModel destinationLocation = LocationModel(
                  dateTime: DateTime.parse(getDestinationDateAndTime.text),
                  address: destinationlocationModel.address,
                  latitude: destinationlocationModel.latitude,
                  longitude: destinationlocationModel.longitude,
                );

                ///We create the [`itenaryDetailsModel`] to add the data about the [`itinerary`]

                ItineraryDetailsModel itenaryDetailsModel =
                    ItineraryDetailsModel(
                  email: Hive.box('user').get('email'),
                  flightDetailsModel: null,
                  vehicleDetailsModel: vehicleDetailsModel,
                  canPickup: false,
                  canDeliver: false,
                  departureLocation: departureLocation,
                  destinationLocation: destinationLocation,
                );

                ItineraryModel itenaryModel = ItineraryModel(
                  dateAdded: DateTime.now(),

                  travelType: _travelType,
                  details: itenaryDetailsModel,
                  // email: Hive.box("user").get('email'),
                );
                Get.off(LoadingPage(text: "Please wait"));
                itenaryService.postItinerary(itenaryModel);
              }
            }
          }
        } else {
          ///If the travel type is bus but the user haven't given his role we display this error message
          snackBarService.showSnackBar(
              "Input error", "Please select your role", true);
          return;
        }
      } else if (_travelType == 3) {
        ///We validate [`flight details`] because the travel type is [`Plane`]
        if (validateFlightDetails()) {
          if (departureValidation()) {
            if (destinationValidation()) {
              print("all details for plane is valid");
              isValid = true;

              //now we have to prepare the models required

              ///This will contain details about the [`flight`]

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

              ItineraryDetailsModel itenaryDetailsModel = ItineraryDetailsModel(
                  email: Hive.box('user').get('email'),
                  vehicleDetailsModel: null,
                  canPickup: false,
                  canDeliver: false,
                  departureLocation: departureLocation,
                  destinationLocation: destinationLocation,
                  flightDetailsModel: flightDetailsModel);

              ItineraryModel itenaryModel = ItineraryModel(
                dateAdded: DateTime.now(),
                travelType: _travelType,
                details: itenaryDetailsModel,
                // email: Hive.box("user").get('email'),
              );
              Get.off(LoadingPage(text: "Please wait"));
              itenaryService.postFlightItinerary(itenaryModel, _flightTicket);
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

              ItineraryDetailsModel itenaryDetailsModel = ItineraryDetailsModel(
                email: Hive.box('user').get('email'),
                flightDetailsModel: null,
                vehicleDetailsModel: vehicleDetailsModel,
                canPickup: (_canPickUp != null) ? _canPickUp : false,
                canDeliver: (_canDeliver != null) ? _canDeliver : false,
                departureLocation: departureLocation,
                destinationLocation: destinationLocation,
              );

              ItineraryModel itenaryModel = ItineraryModel(
                dateAdded: DateTime.now(),

                travelType: _travelType,
                details: itenaryDetailsModel,
                // email: Hive.box("user").get('email'),
              );
              Get.off(LoadingPage(text: "Please wait"));
              itenaryService.postItinerary(itenaryModel);
            }
          }
        }
      }
    }

    ///If the user haven't selected a travel type we display a error message
    else {
      snackBarService.showSnackBar(
          "Input error", "Please select the travel type", true);
      return;
    }
    return isValid;
  }

  ///We use this function to validate the [`flight details`] added by the user
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

  ///We use this function to validate the [`vehicle details`] added by the user

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

  ///We use this function to validate the [`departure details`] added by the user

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

  ///We use this function to validate the [`destination details`] added by the user

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

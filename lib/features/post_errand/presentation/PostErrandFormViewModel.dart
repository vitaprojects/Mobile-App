import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class PostErrandFormViewModel extends ChangeNotifier {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  double margin = Globals.blockWidth * 5;
  final picker = ImagePicker();
  final SnackBarService snackBarService = locator<SnackBarService>();
  final ErrandService errandService = locator<ErrandService>();

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  TextEditingController get getpickUpStore => controllers[0];
  TextEditingController get getGroceryType => controllers[1];
  TextEditingController get getpickUpPhone => controllers[2];
  TextEditingController get getOrderNo => controllers[3];
  TextEditingController get getInstructions => controllers[4];
  TextEditingController get getMyAmount => controllers[5];
  TextEditingController get getMyTip => controllers[6];
  TextEditingController get getMyTotalOffer => controllers[7];

  List<File> imagesOfTheErrand = [];

  LocationModel pickUplocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );

  clearPickUpLocation() {
    pickUplocationModel.latitude =
        pickUplocationModel.longitude = pickUplocationModel.address = null;

    notifyListeners();
  }

  setValuesForPickUpLocation(
      double latitude, double longitude, String address) {
    pickUplocationModel.latitude = latitude;
    pickUplocationModel.longitude = longitude;
    pickUplocationModel.address = address;

    notifyListeners();
  }

  LocationModel dropOfflocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );

  clearDropOffLocation() {
    dropOfflocationModel.latitude =
        dropOfflocationModel.longitude = dropOfflocationModel.address = null;

    notifyListeners();
  }

  setValuesForDropOffLocation(
      double latitude, double longitude, String address) {
    dropOfflocationModel.latitude = latitude;
    dropOfflocationModel.longitude = longitude;
    dropOfflocationModel.address = address;

    notifyListeners();
  }

  Future getImage(int type) async {
    //this function is used to  upload pictures
    PickedFile pickedFile;
    File croppedFile;
    if (type == 0) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      croppedFile = await ImageCropper.cropImage(
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

    if (croppedFile != null) {
      imagesOfTheErrand.add(croppedFile);
      notifyListeners();
    }
  }

  validateValuesInForm() {
    bool isValid = false;
    if (getpickUpStore.text.isNotEmpty) {
      if (getGroceryType.text.isNotEmpty) {
        if (pickUplocationModel.latitude != null &&
            pickUplocationModel.longitude != null) {
          if (getpickUpPhone.text.isNotEmpty) {
            if (dropOfflocationModel.latitude != null &&
                dropOfflocationModel.longitude != null) {
              if (getInstructions.text.isNotEmpty) {
                if (getMyAmount.text.isNotEmpty && isFloat(getMyAmount.text)) {
                  if (getMyTip.text.isEmpty ||
                      (getMyTip.text.isNotEmpty && isFloat(getMyTip.text))) {
                    if (imagesOfTheErrand.length != 0) {
                      isValid = true;
                    } else {
                      snackBarService.showSnackBar(
                          "Images of the errand missing",
                          "Please add images of the errand",
                          true);
                    }
                  } else {
                    snackBarService.showSnackBar("Invalid tip amount",
                        "Please add a valid tip amount", true);
                  }
                } else {
                  snackBarService.showSnackBar(
                      "Offer missing", "Please add your offer", true);
                }
              } else {
                snackBarService.showSnackBar("Instructions missing",
                    "Please add the instructions for the driver", true);
              }
            } else {
              snackBarService.showSnackBar("Dropoff address missing",
                  "Please select the dropoff address", true);
            }
          } else {
            snackBarService.showSnackBar("Pickup or Store phone missing",
                "Please add the pickup or store phone", true);
          }
        } else {
          snackBarService.showSnackBar("Pickup address missing",
              "Please select the pickup address", true);
        }
      } else {
        snackBarService.showSnackBar(
            "Pickup type missing", "Please add the pickup type", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Pickup place missing", "Please add the pickup place", true);
    }

    return isValid;
  }

  submitValuesInForm() {
    if (validateValuesInForm()) {
      print("all are valid");

      PostErrandModel postErrandModel = PostErrandModel(
        type: 1,
        pickUpFrom: getpickUpStore.text,
        pickUpType: getGroceryType.text,
        pAddress: pickUplocationModel,
        phone: getpickUpPhone.text,
        orderNo: getOrderNo.text,
        dAddress: dropOfflocationModel,
        instructions: getInstructions.text,
        payment: double.parse(getMyAmount.text),
        tip: (getMyTip.text.isEmpty)
            ? double.parse("0")
            : double.parse(getMyTip.text),
      );

      errandService.uploadImagesOftheErrand(imagesOfTheErrand, postErrandModel);
    }
  }
}

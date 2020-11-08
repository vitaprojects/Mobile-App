import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/features/send_package/data/UserModelInPackage.dart';
import 'package:newpostman1/features/send_package/domain/bloc/SendPackageBloc.dart';
import 'package:newpostman1/features/send_package/domain/events/SendPackageEvent.dart';
import 'package:newpostman1/features/send_package/domain/services/send_package_service.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageForm2.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageSecondPage.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageThirdPage.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:string_validator/string_validator.dart';

class SendPackageViewModel extends ChangeNotifier {
  List<File> imagesOfThePackage = [];
  final picker = ImagePicker();

  final SnackBarService snackBarService = locator<SnackBarService>();
  final SendPackageService sendPackageService = locator<SendPackageService>();

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
      imagesOfThePackage.add(croppedFile);
      notifyListeners();
    }
  }

  //this section will be for the basic information of the item
  List<TextEditingController> itemBasicInfoControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  int isInsuranceProtected;

  TextEditingController get getItemName => itemBasicInfoControllers[0];
  TextEditingController get getItemValue => itemBasicInfoControllers[1];

  TextEditingController get getItemDescription => itemBasicInfoControllers[2];

  setInsuranceProtected(int val) {
    isInsuranceProtected = val;
    notifyListeners();
  }

  //

  //this section will be for the item weight and dimensions

  int parcelWeightType;

  setSelectedRadioTile(int val) {
    print("tile selected");
    parcelWeightType = val;
    notifyListeners();
  }

  List<TextEditingController> parcelWeightAndDimensionControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  TextEditingController get getItemLength =>
      parcelWeightAndDimensionControllers[0];
  TextEditingController get getItemWidth =>
      parcelWeightAndDimensionControllers[1];

  TextEditingController get getItemHeight =>
      parcelWeightAndDimensionControllers[2];

  TextEditingController get getItemPreciseWeight =>
      parcelWeightAndDimensionControllers[3];

  //

  //this section will be for submitting the values in the form 1 page

  submitValuesInForm1(context) {
    //this method is to submit the values we get in from 1 and create a object and pass it to the second form
    //first we have to validate the data entered by users in form1

    if (imagesOfThePackage.length != 0) {
      if (validateItemBasicDetails()) {
        if (validateItemWeightandDimensions()) {
          print("item data in form 1 is valid");

          PackageModel packageModel = PackageModel(
            name: getItemName.text,
            value: double.parse(getItemValue.text),
            isInsurancePro: (isInsuranceProtected == 0) ? true : false,
            description: getItemDescription.text,
            isStandard: (parcelWeightType == 0) ? true : false,
            preciseWeight: (parcelWeightType == 0)
                ? null
                : double.parse(getItemPreciseWeight.text),
            length: double.parse(getItemLength.text),
            height: double.parse(getItemHeight.text),
            width: double.parse(getItemWidth.text),
          );

          BlocProvider.of<SendPackageBloc>(context)
              .add(SendPackageEvent.addForm1Data(packageModel));

          Get.to(
            BlocProvider.value(
              value: BlocProvider.of<SendPackageBloc>(context),
              child: SendPackageSecondPage(
                packageImages: imagesOfThePackage,
              ),
            ),
          );
          print("hui");
        }
      }
    } else {
      snackBarService.showSnackBar(
          "Images missing", "Please upload images of the package", true);
    }
  }

  bool validateItemBasicDetails() {
    bool isValid = false;

    // print(isFloat(""));
    if (getItemName.text.isNotEmpty) {
      if (getItemValue.text.isNotEmpty && isFloat(getItemValue.text.trim())) {
        // print(getItemValue.text.trim());

        if (isInsuranceProtected != null) {
          if (getItemDescription.text.isNotEmpty) {
            isValid = true;
          } else {
            snackBarService.showSnackBar("Description missing",
                "Please add the description of the package", true);
          }
        } else {
          snackBarService.showSnackBar("Protection type missing",
              "Please add whether the package is protected or not", true);
        }
      } else {
        snackBarService.showSnackBar(
            "Value error", "Please enter a valid value for the package", true);
      }
    } else {
      snackBarService.showSnackBar(
          "Name missing", "Please add the name of the package", true);
    }

    return isValid;
  }

  //valiadate item weight and dimensions

  bool validateItemWeightandDimensions() {
    bool isValid = false;

    if (parcelWeightType != null) {
      if (parcelWeightType == 1) {
        if (getItemPreciseWeight.text.isNotEmpty &&
            isFloat(getItemPreciseWeight.text.trim())) {
          if (validateLengthWidthHeight()) {
            isValid = true;
          }
        } else {
          snackBarService.showSnackBar("Parcel weight error",
              "Please enter a valid precise weight of the parcel", true);
        }
      } else {
        if (validateLengthWidthHeight()) {
          isValid = true;
        }
      }
    } else {
      snackBarService.showSnackBar(
          "Parcel type missing", "Please add the type of the package", true);
    }

    return isValid;
  }

  bool validateLengthWidthHeight() {
    bool isValid = false;

    if (getItemLength.text.isNotEmpty && isFloat(getItemLength.text.trim())) {
      if (getItemWidth.text.isNotEmpty && isFloat(getItemWidth.text.trim())) {
        if (getItemHeight.text.isNotEmpty &&
            isFloat(getItemHeight.text.trim())) {
          isValid = true;
        } else {
          snackBarService.showSnackBar("Parcel height error",
              "Please add a valid height of the parcel", true);
        }
      } else {
        snackBarService.showSnackBar("Parcel width error",
            "Please add a valid width of the parcel", true);
      }
    } else {
      snackBarService.showSnackBar("Parcel length error",
          "Please add a valid length of the parcel", true);
    }

    return isValid;
  }

  ///get data from the second from in send package
  LocationModel departurelocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );
  TextEditingController departureDateTimeController = TextEditingController();

  TextEditingController get getDepartureDateTimeController =>
      departureDateTimeController;

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

  ///get data from the second from in send package
  LocationModel destinationlocationModel = LocationModel(
    address: null,
    // dateTime: "",
    latitude: null,
    longitude: null,
  );
  TextEditingController destinationeDateTimeController =
      TextEditingController();

  TextEditingController get getDestinationDateTimeController =>
      destinationeDateTimeController;

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

  //submit values in form 2

  submitValuesInForm2(contextP, List<File> packageImages) {
    if (validateDepartureDetails() && validateDestinationDetails()) {
      print("data in form 2 is valid");

      departurelocationModel.dateTime =
          DateTime.parse(getDepartureDateTimeController.text);

      destinationlocationModel.dateTime =
          DateTime.parse(getDestinationDateTimeController.text);

      PackageModel packageModel = PackageModel(
        dLocation: departurelocationModel,
        fLocation: destinationlocationModel,
      );

      BlocProvider.of<SendPackageBloc>(contextP)
          .add(SendPackageEvent.addForm2Data(packageModel));

      Navigator.push(
          contextP,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: BlocProvider.of<SendPackageBloc>(contextP),
              child: SendPackageThirdPage(
                packageImages: packageImages,
              ),
            ),
          ));
      // Get.to(SendPackageThirdPage());
      print("hi");
    }
  }

  validateDepartureDetails() {
    bool isValid = false;
    if (getDepartureDateTimeController.text.isNotEmpty) {
      if (departurelocationModel.latitude != null &&
          departurelocationModel.longitude != null) {
        isValid = true;
      } else {
        snackBarService.showSnackBar("Departing location error",
            "Please add the location of departure", true);
      }
    } else {
      snackBarService.showSnackBar("Departing date error",
          "Please add a valid date and time for the departure", true);
    }

    return isValid;
  }

  validateDestinationDetails() {
    bool isValid = false;
    if (getDestinationDateTimeController.text.isNotEmpty) {
      if (destinationlocationModel.latitude != null &&
          destinationlocationModel.longitude != null) {
        isValid = true;
      } else {
        snackBarService.showSnackBar("Destination location error",
            "Please add the location of destination", true);
      }
    } else {
      snackBarService.showSnackBar("Destination date error",
          "Please add a valid date and time for the destination", true);
    }

    return isValid;
  }

  //this section is to add data for the third form page in send pacakge

  List<TextEditingController> senderDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> receiverDetailsControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  TextEditingController get getSenderName => senderDetailsControllers[0];
  TextEditingController get getSenderPhone => senderDetailsControllers[1];

  TextEditingController get getReceiverName => receiverDetailsControllers[0];
  TextEditingController get getReceiverPhone => receiverDetailsControllers[1];

  TextEditingController notetextEditingController = TextEditingController();
  TextEditingController get noteController => notetextEditingController;

  submitValuesInForm3(PackageModel packageModel, List<File> packageImages) {
    if (validateSenderdata() && validateReceiverData()) {
      print("all data is valid in form 3");

      UserModelInPackage senderuserModelInPackage = UserModelInPackage(
          mobile: getSenderPhone.text, name: getSenderName.text);

      UserModelInPackage receiveruserModelInPackage = UserModelInPackage(
          mobile: getReceiverPhone.text, name: getReceiverName.text);

      packageModel.rDetails = receiveruserModelInPackage;
      packageModel.sDetails = senderuserModelInPackage;
      packageModel.note = noteController.text;

      // print(packageImages.length);
      Get.to(LoadingPage(
          text: "Please wait while the package details are uploded"));
      sendPackageService.uploadImagesOfthePackage(packageImages, packageModel);
    }
  }

  validateSenderdata() {
    bool isValid = false;

    if (getSenderName.text.isNotEmpty) {
      if (getSenderPhone.text.isNotEmpty) {
        isValid = true;
      } else {
        snackBarService.showSnackBar("Sender phone number is empty",
            "Please add a valid phone number of the sender", true);
      }
    } else {
      snackBarService.showSnackBar("Sender name is empty",
          "Please add a valid name for the sender", true);
    }

    return isValid;
  }

  validateReceiverData() {
    bool isValid = false;

    if (getReceiverName.text.isNotEmpty) {
      if (getReceiverPhone.text.isNotEmpty) {
        isValid = true;
      } else {
        snackBarService.showSnackBar("Receiver phone number is empty",
            "Please add a valid phone number of the receiver", true);
      }
    } else {
      snackBarService.showSnackBar("Receiver name is empty",
          "Please add a valid name for the receiver", true);
    }

    return isValid;
  }
}

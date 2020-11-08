import 'dart:io';

import 'package:newpostman1/features/send_package/data/UserModelInPackage.dart';
import 'package:newpostman1/models/LocationModel.dart';

class Form1Data {
  File imagesOfPackage;
  String itemName;
  String itemValue;
  bool isInsuranceProtected;
  String itemDescription;
  int weightType; //standard or parcel
  double preciseWeight;
  double length;
  double width;
  double height;

  Form1Data({
    this.imagesOfPackage,
    this.itemName,
    this.itemValue,
    this.isInsuranceProtected,
    this.itemDescription,
    this.weightType,
    this.preciseWeight,
    this.length,
    this.height,
    this.width,
  });
}

class Form2Data {
  LocationModel departingLocation;
  LocationModel destinationLocation;

  Form2Data({
    this.departingLocation,
    this.destinationLocation,
  });
}

class Form3Data {
  UserModelInPackage senderDetails;
  UserModelInPackage receiverDetails;
  String noteForPostman;

  Form3Data({
    this.senderDetails,
    this.noteForPostman,
    this.receiverDetails,
  });
}

import 'package:newpostman1/models/UserModelInPackage.dart';

class PackageModel {
  String name;
  double value; //the value of the item
  bool isInsurancePro; //is the item insurance protected
  String description;
  bool isStandard;
  double preciseWeight;
  double length;
  double height;
  double width;
  UserInPackage sDetails; //details of the sender
  UserInPackage rDetails; //details of the receiver
}

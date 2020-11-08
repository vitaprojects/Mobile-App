import 'package:json_annotation/json_annotation.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/features/send_package/data/UserModelInPackage.dart';

part 'PackageModel.g.dart';

@JsonSerializable()
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
  UserModelInPackage sDetails; //details of the sender
  UserModelInPackage rDetails; //details of the receiver
  LocationModel dLocation; //departure location
  LocationModel fLocation; //final location
  String note;
  List<String> images; //network image urls
  PackageModel({
    this.name,
    this.value,
    this.isInsurancePro,
    this.description,
    this.isStandard,
    this.preciseWeight,
    this.length,
    this.height,
    this.width,
    this.sDetails,
    this.rDetails,
    this.dLocation,
    this.fLocation,
    this.note,
    this.images,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}

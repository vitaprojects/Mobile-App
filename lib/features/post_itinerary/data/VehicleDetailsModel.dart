import 'package:json_annotation/json_annotation.dart';

part 'VehicleDetailsModel.g.dart';

@JsonSerializable()
class VehicleDetailsModel {
  String vehicleId; //vehicle identification
  String transportcompany;
  String licensePlateNumber;
  int driverPassenderOrCon; //this field is for the bus because we ask from the user about his role
  //so when we are filling the details for the bus travel type we have to fill this field also
  VehicleDetailsModel({
    this.vehicleId,
    this.transportcompany,
    this.licensePlateNumber,
    this.driverPassenderOrCon,
  });

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDetailsModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'VehicleDetailsModel.g.dart';

@JsonSerializable()
class VehicleDetailsModel {
  String vehicleId; //vehicle identification
  String transportcompany;
  String licensePlateNumber;
  VehicleDetailsModel({
    this.vehicleId,
    this.transportcompany,
    this.licensePlateNumber,
  });

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDetailsModelToJson(this);
}

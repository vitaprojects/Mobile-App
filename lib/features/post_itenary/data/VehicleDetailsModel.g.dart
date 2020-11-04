// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VehicleDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDetailsModel _$VehicleDetailsModelFromJson(Map<String, dynamic> json) {
  return VehicleDetailsModel(
    vehicleId: json['vehicleId'] as String,
    transportcompany: json['transportcompany'] as String,
    licensePlateNumber: json['licensePlateNumber'] as String,
  );
}

Map<String, dynamic> _$VehicleDetailsModelToJson(
        VehicleDetailsModel instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'transportcompany': instance.transportcompany,
      'licensePlateNumber': instance.licensePlateNumber,
    };

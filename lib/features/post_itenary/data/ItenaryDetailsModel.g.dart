// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItenaryDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItenaryDetailsModel _$ItenaryDetailsModelFromJson(Map<String, dynamic> json) {
  return ItenaryDetailsModel(
    vehicleDetailsModel: json['vehicleDetailsModel'] == null
        ? null
        : VehicleDetailsModel.fromJson(
            json['vehicleDetailsModel'] as Map<String, dynamic>),
    canPickup: json['canPickup'] as bool,
    canDeliver: json['canDeliver'] as bool,
    departureLocation: json['departureLocation'] == null
        ? null
        : LocationModel.fromJson(
            json['departureLocation'] as Map<String, dynamic>),
    destinationLocation: json['destinationLocation'] == null
        ? null
        : LocationModel.fromJson(
            json['destinationLocation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItenaryDetailsModelToJson(
        ItenaryDetailsModel instance) =>
    <String, dynamic>{
      'vehicleDetailsModel': instance.vehicleDetailsModel,
      'canPickup': instance.canPickup,
      'canDeliver': instance.canDeliver,
      'departureLocation': instance.departureLocation,
      'destinationLocation': instance.destinationLocation,
    };

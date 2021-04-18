// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryDetailsModel _$ItenaryDetailsModelFromJson(Map<String, dynamic> json) {
  return ItineraryDetailsModel(
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
    flightDetailsModel: json['flightDetailsModel'] == null
        ? null
        : FlightDetailsModel.fromJson(
            json['flightDetailsModel'] as Map<String, dynamic>),
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$ItenaryDetailsModelToJson(
        ItineraryDetailsModel instance) =>
    <String, dynamic>{
      'vehicleDetailsModel': instance.vehicleDetailsModel?.toJson(),
      'flightDetailsModel': instance.flightDetailsModel?.toJson(),
      'canPickup': instance.canPickup,
      'canDeliver': instance.canDeliver,
      'departureLocation': instance.departureLocation.toJson(),
      'destinationLocation': instance.destinationLocation.toJson(),
      'email': instance.email,
    };

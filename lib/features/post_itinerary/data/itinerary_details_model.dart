import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newpostman1/features/post_itinerary/data/VehicleDetailsModel.dart';
import 'package:newpostman1/features/post_itinerary/data/travelTypes/FlightDetailsModel.dart';
import 'package:newpostman1/models/LocationModel.dart';

part 'itinerary_details_model.g.dart';

@JsonSerializable()
class ItineraryDetailsModel {
  // TravelType
  //     travelType; //this value is set only for the bus and the plane becuase it has some separate details
  //for the remaming traveltypes we can leave this as null

  VehicleDetailsModel
      vehicleDetailsModel; //if the travel type is plane then this field should be null

  FlightDetailsModel
      flightDetailsModel; //if the travel type is plane this field should be filled

  bool canPickup;
  bool canDeliver;
  LocationModel departureLocation;
  LocationModel destinationLocation;
  String email;

  ItineraryDetailsModel({
    @required this.vehicleDetailsModel,
    @required this.canPickup,
    @required this.canDeliver,
    @required this.departureLocation,
    @required this.destinationLocation,
    @required this.flightDetailsModel,
    @required this.email,
  });

  factory ItineraryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ItenaryDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItenaryDetailsModelToJson(this);
}
// 'vehicleDetailsModel': instance.vehicleDetailsModel?.toJson(),
// 'flightDetailsModel': instance.flightDetailsModel?.toJson(),
// 'canPickup': instance.canPickup,
// 'canDeliver': instance.canDeliver,
// 'departureLocation': instance.departureLocation.toJson(),
// 'destinationLocation': instance.destinationLocation.toJson(),

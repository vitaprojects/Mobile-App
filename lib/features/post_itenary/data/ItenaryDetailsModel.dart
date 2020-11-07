import 'package:flutter/foundation.dart';
import 'package:newpostman1/features/post_itenary/data/travelTypes/FlightDetailsModel.dart';
import 'package:newpostman1/features/post_itenary/data/travelTypes/TravelType.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/features/post_itenary/data/VehicleDetailsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ItenaryDetailsModel.g.dart';

@JsonSerializable()
class ItenaryDetailsModel {
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
  ItenaryDetailsModel({
    @required this.vehicleDetailsModel,
    @required this.canPickup,
    @required this.canDeliver,
    @required this.departureLocation,
    @required this.destinationLocation,
    @required this.flightDetailsModel,
  });

  factory ItenaryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ItenaryDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItenaryDetailsModelToJson(this);
}
// 'vehicleDetailsModel': instance.vehicleDetailsModel?.toJson(),
// 'flightDetailsModel': instance.flightDetailsModel?.toJson(),
// 'canPickup': instance.canPickup,
// 'canDeliver': instance.canDeliver,
// 'departureLocation': instance.departureLocation.toJson(),
// 'destinationLocation': instance.destinationLocation.toJson(),

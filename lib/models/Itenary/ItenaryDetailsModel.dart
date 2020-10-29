import 'package:flutter/foundation.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/models/Itenary/VehicleDetailsModel.dart';
import 'package:newpostman1/models/travelTypes/TravelType.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'ItenaryDetailsModel.g.dart';

@JsonSerializable()
class ItenaryDetailsModel {
  TravelType
      travelType; //this value is set only for the bus and the plane becuase it has some separate details
  //for the remaming traveltypes we can leave this as null

  VehicleDetailsModel
      vehicleDetailsModel; //if the travel type is plane then this field should be null

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
  });

  // factory ItenaryDetailsModel.fromJson(Map<String, dynamic> json) =>
  //     _$ItenaryDetailsModelFromJson(json);

  // Map<String, dynamic> toJson() => _$ItenaryDetailsModelToJson(this);
}

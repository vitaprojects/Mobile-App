import 'package:flutter/foundation.dart';
import 'package:newpostman1/features/post_itinerary/data/itinerary_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Itinerary_model.g.dart';

@JsonSerializable()
class ItineraryModel {
  int travelType; //whether the type is bus , car , truck ,plane
  ItineraryDetailsModel details;
  // String email; //this email of the user;
  ItineraryModel({
    @required this.travelType,
    @required this.details,
    @required this.dateAdded,
    // @required this.departureDate,
  });

  DateTime dateAdded;

  factory ItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$ItenaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItenaryModelToJson(this);

  //   'travelType': instance.travelType,
  // 'details': instance.details.toJson(),
  // 'email': instance.email,

}

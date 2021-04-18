// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Itinerary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryModel _$ItenaryModelFromJson(Map<String, dynamic> json) {
  return ItineraryModel(
    travelType: json['travelType'] as int,
    details: json['details'] == null
        ? null
        : ItineraryDetailsModel.fromJson(
            json['details'] as Map<String, dynamic>),
    dateAdded: json['dateAdded'] == null
        ? null
        : DateTime.parse(json['dateAdded'] as String),
  );
}

Map<String, dynamic> _$ItenaryModelToJson(ItineraryModel instance) =>
    <String, dynamic>{
      'travelType': instance.travelType,
      'details': instance.details.toJson(),
      'dateAdded': instance.dateAdded?.toIso8601String(),
    };

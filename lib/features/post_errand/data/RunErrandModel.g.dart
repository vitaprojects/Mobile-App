// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RunErrandModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunErrandModel _$RunErrandModelFromJson(Map<String, dynamic> json) {
  return RunErrandModel(
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    postmanEmail: json['postmanEmail'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$RunErrandModelToJson(RunErrandModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'postmanEmail': instance.postmanEmail,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': instance.type,
    };

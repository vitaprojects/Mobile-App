// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    address: json['address'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    terminal: json['terminal'] as String,
    airport: json['airport'] as String,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'terminal': instance.terminal,
      'airport': instance.airport,
    };

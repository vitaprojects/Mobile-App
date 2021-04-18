// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlightDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightDetailsModel _$FlightDetailsModelFromJson(Map<String, dynamic> json) {
  return FlightDetailsModel(
    ticketUrl: json['ticketUrl'] as String,
    flightNumber: json['flightNumber'] as String,
    airLineNumber: json['airLineNumber'] as String,
  );
}

Map<String, dynamic> _$FlightDetailsModelToJson(FlightDetailsModel instance) =>
    <String, dynamic>{
      'ticketUrl': instance.ticketUrl,
      'flightNumber': instance.flightNumber,
      'airLineNumber': instance.airLineNumber,
    };

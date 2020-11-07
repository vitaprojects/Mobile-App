// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItenaryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItenaryModel _$ItenaryModelFromJson(Map<String, dynamic> json) {
  return ItenaryModel(
    travelType: json['travelType'] as int,
    details: json['details'] == null
        ? null
        : ItenaryDetailsModel.fromJson(json['details'] as Map<String, dynamic>),
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$ItenaryModelToJson(ItenaryModel instance) =>
    <String, dynamic>{
      'travelType': instance.travelType,
      'details': instance.details.toJson(),
      'email': instance.email,
    };

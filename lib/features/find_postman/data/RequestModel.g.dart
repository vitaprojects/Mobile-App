// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) {
  return RequestModel(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    type: json['type'] as int,
    requestId: json['requestId'] as String,
    packageDocID: json['packageDocID'] as String,
    status: json['status'] as int,
    postman: json['postman'] as String,
    user: json['user'] as String,
    hasSeenbyPostman: json['hasSeenbyPostman'] as bool,
    hasSeenbyUser: json['hasSeenbyUser'] as bool,
  );
}

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'type': instance.type,
      'requestId': instance.requestId,
      'status': instance.status,
      'postman': instance.postman,
      'user': instance.user,
      'hasSeenbyPostman': instance.hasSeenbyPostman,
      'hasSeenbyUser': instance.hasSeenbyUser,
      'packageDocID': instance.packageDocID,
    };

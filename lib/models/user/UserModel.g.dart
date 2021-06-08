// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    email: json['email'] as String,
    fname: json['fname'] as String,
    lname: json['lname'] as String,
    phone: json['phone'] as String,
    deviceIds: (json['deviceIds'] as List)?.map((e) => e as String)?.toList(),
    totalEarnings: (json['totalEarnings'] as num)?.toDouble(),
    activeJobs: json['activeJobs'] as int,
    completedJobs: json['completedJobs'] as int,
    rejectedJobs: json['rejectedJobs'] as int,
    stripeId: json['stripeId'] as String,
    totalCleared: (json['totalCleared'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'phone': instance.phone,
      'email': instance.email,
      'deviceIds': instance.deviceIds,
      'totalEarnings': instance.totalEarnings,
      'completedJobs': instance.completedJobs,
      'activeJobs': instance.activeJobs,
      'rejectedJobs': instance.rejectedJobs,
      'stripeId': instance.stripeId,
      'totalCleared': instance.totalCleared,
    };

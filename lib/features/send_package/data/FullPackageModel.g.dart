// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FullPackageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullPackageModel _$FullPackageModelFromJson(Map<String, dynamic> json) {
  return FullPackageModel(
    postedBy: json['postedBy'] as String,
    datePosted: json['datePosted'] == null
        ? null
        : DateTime.parse(json['datePosted'] as String),
    packageModel: json['packageModel'] == null
        ? null
        : PackageModel.fromJson(json['packageModel'] as Map<String, dynamic>),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$FullPackageModelToJson(FullPackageModel instance) =>
    <String, dynamic>{
      'datePosted': instance.datePosted?.toIso8601String(),
      'postedBy': instance.postedBy,
      'packageModel': instance.packageModel,
      'status': instance.status,
    };

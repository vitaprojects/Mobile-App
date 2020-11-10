// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PackageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) {
  return PackageModel(
    name: json['name'] as String,
    docId: json['docId'] as String,
    value: (json['value'] as num)?.toDouble(),
    isInsurancePro: json['isInsurancePro'] as bool,
    description: json['description'] as String,
    isStandard: json['isStandard'] as bool,
    preciseWeight: (json['preciseWeight'] as num)?.toDouble(),
    length: (json['length'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    width: (json['width'] as num)?.toDouble(),
    sDetails: json['sDetails'] == null
        ? null
        : UserModelInPackage.fromJson(json['sDetails'] as Map<String, dynamic>),
    rDetails: json['rDetails'] == null
        ? null
        : UserModelInPackage.fromJson(json['rDetails'] as Map<String, dynamic>),
    dLocation: json['dLocation'] == null
        ? null
        : LocationModel.fromJson(json['dLocation'] as Map<String, dynamic>),
    fLocation: json['fLocation'] == null
        ? null
        : LocationModel.fromJson(json['fLocation'] as Map<String, dynamic>),
    note: json['note'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'isInsurancePro': instance.isInsurancePro,
      'description': instance.description,
      'isStandard': instance.isStandard,
      'preciseWeight': instance.preciseWeight,
      'length': instance.length,
      'height': instance.height,
      'width': instance.width,
      'sDetails': instance.sDetails.toJson(),
      'rDetails': instance.rDetails.toJson(),
      'dLocation': instance.dLocation.toJson(),
      'fLocation': instance.fLocation.toJson(),
      'note': instance.note,
      'images': instance.images,
      'docId': instance.docId,
    };

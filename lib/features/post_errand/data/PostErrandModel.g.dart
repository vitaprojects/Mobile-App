// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostErrandModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostErrandModel _$PostErrandModelFromJson(Map<String, dynamic> json) {
  return PostErrandModel(
    pickUpFrom: json['pickUpFrom'] as String,
    pickUpType: json['pickUpType'] as String,
    pAddress: json['pAddress'] == null
        ? null
        : LocationModel.fromJson(json['pAddress'] as Map<String, dynamic>),
    dAddress: json['dAddress'] == null
        ? null
        : LocationModel.fromJson(json['dAddress'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    orderNo: json['orderNo'] as String,
    instructions: json['instructions'] as String,
    payment: (json['payment'] as num)?.toDouble(),
    tip: (json['tip'] as num)?.toDouble(),
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$PostErrandModelToJson(PostErrandModel instance) =>
    <String, dynamic>{
      'pickUpFrom': instance.pickUpFrom,
      'pickUpType': instance.pickUpType,
      'pAddress': instance.pAddress.toJson(),
      'dAddress': instance.dAddress.toJson(),
      'phone': instance.phone,
      'orderNo': instance.orderNo,
      'instructions': instance.instructions,
      'payment': instance.payment,
      'tip': instance.tip,
      'images': instance.images,
      'type': instance.type,
    };

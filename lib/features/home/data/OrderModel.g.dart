// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    gst: (json['gst'] as num)?.toDouble(),
    subtotal: (json['subtotal'] as num)?.toDouble(),
    postmanFee: (json['postmanFee'] as num)?.toDouble(),
    pacakgeDocId: json['pacakgeDocId'] as String,
    postmanEmail: json['postmanEmail'] as String,
    statusOftheOrder: json['statusOftheOrder'] as int,
    tipAmount: (json['tipAmount'] as num)?.toDouble(),
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    type: json['type'] as int,
    userEmail: json['userEmail'] as String,
    orderID: json['orderID'] as String,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'pacakgeDocId': instance.pacakgeDocId,
      'postmanEmail': instance.postmanEmail,
      'userEmail': instance.userEmail,
      'statusOftheOrder': instance.statusOftheOrder,
      'tipAmount': instance.tipAmount,
      'totalAmount': instance.totalAmount,
      'orderID': instance.orderID,
      'gst': instance.gst,
      'subtotal': instance.subtotal,
      'postmanFee': instance.postmanFee
    };

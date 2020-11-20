import 'package:json_annotation/json_annotation.dart';
part 'OrderModel.g.dart';

@JsonSerializable()
class OrderModel {
  int type;

  ///errand or pacakge
  String pacakgeDocId;
  String postmanEmail;
  String userEmail;
  int statusOftheOrder;
  double feeAmount;
  double tipAmount;
  double totalAmount;

  OrderModel({
    this.feeAmount,
    this.pacakgeDocId,
    this.postmanEmail,
    this.statusOftheOrder,
    this.tipAmount,
    this.totalAmount,
    this.type,
    this.userEmail,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

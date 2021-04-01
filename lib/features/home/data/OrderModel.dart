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
  double subtotal;
  double totalAmount;
  double gst;
  double postmanFee;
  double tipAmount;
  String orderID;

  OrderModel({
    this.type,
    this.pacakgeDocId,
    this.postmanEmail,
    this.userEmail,
    this.statusOftheOrder,
    this.subtotal,
    this.totalAmount,
    this.gst,
    this.postmanFee,
    this.tipAmount,
    this.orderID,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

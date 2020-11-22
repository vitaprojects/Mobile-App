import 'package:json_annotation/json_annotation.dart';
import 'package:newpostman1/models/LocationModel.dart';
part 'PostErrandModel.g.dart';

@JsonSerializable()
class PostErrandModel {
  String pickUpFrom;
  String pickUpType;
  LocationModel pAddress; //pickup address
  LocationModel dAddress; //drop off address
  String phone;
  String orderNo;
  String instructions;
  double payment; //the amount customer is offering
  double tip;
  List<String> images;
  int type;
  String userEmaill;
  DateTime datePosted;
  String docId;

  PostErrandModel({
    this.pickUpFrom,
    this.pickUpType,
    this.pAddress,
    this.dAddress,
    this.phone,
    this.orderNo,
    this.instructions,
    this.payment,
    this.tip,
    this.images,
    this.type,
    this.userEmaill,
    this.datePosted,
    this.docId,
  });

  factory PostErrandModel.fromJson(Map<String, dynamic> json) =>
      _$PostErrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostErrandModelToJson(this);
}

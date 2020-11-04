import 'package:flutter/foundation.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryDetailsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ItenaryModel.g.dart';

@JsonSerializable()
class ItenaryModel {
  int travelType; //whether the type is bus , car , truck ,plane
  ItenaryDetailsModel details;
  String email; //this email of the user;
  ItenaryModel({
    @required this.travelType,
    @required this.details,
    @required this.email,
  });

  factory ItenaryModel.fromJson(Map<String, dynamic> json) =>
      _$ItenaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItenaryModelToJson(this);
}

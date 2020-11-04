import 'package:json_annotation/json_annotation.dart';
part 'RunErrandModel.g.dart';

@JsonSerializable()
class RunErrandModel {
  DateTime dateTime;
  String postmanEmail;
  double latitude;
  double longitude;
  int type;

  RunErrandModel({
    this.dateTime,
    this.postmanEmail,
    this.latitude,
    this.longitude,
    this.type,
  });

  factory RunErrandModel.fromJson(Map<String, dynamic> json) =>
      _$RunErrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$RunErrandModelToJson(this);
}

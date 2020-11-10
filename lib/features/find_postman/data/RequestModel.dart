import 'package:json_annotation/json_annotation.dart';
part 'RequestModel.g.dart';

@JsonSerializable()
class RequestModel {
  DateTime date;
  int type; // package or errand
  String requestId;
  int status; //the status of the request

  String postman; //the email of the postman

  String user; //the email of the person who added the request

  bool hasSeenbyPostman; //whether the postman or the user has seen the request
  bool hasSeenbyUser;

  RequestModel({
    this.date,
    this.type,
    this.requestId,
    this.status,
    this.postman,
    this.user,
    this.hasSeenbyPostman,
    this.hasSeenbyUser,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

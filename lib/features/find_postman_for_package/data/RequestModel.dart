import 'package:json_annotation/json_annotation.dart';
part 'RequestModel.g.dart';

@JsonSerializable()
class RequestModel {
  DateTime date;
  int type; // package or errand
  String requestId;
  String packageDocID;
  int status; //the status of the request

  String postman; //the email of the postman

  String user; //the email of the person who added the request

  bool hasSeenbyPostman; //whether the postman or the user has seen the request
  bool hasSeenbyUser;

  ///if the postman haven't added a [`offer`] yet the value will be [`-1`]
  double postmanOffer;

  RequestModel({
    this.date,
    this.type,
    this.requestId,
    this.status,
    this.postman,
    this.user,
    this.hasSeenbyPostman,
    this.hasSeenbyUser,
    this.packageDocID,
    this.postmanOffer = -1,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

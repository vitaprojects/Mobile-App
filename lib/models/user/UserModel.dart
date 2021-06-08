import 'package:json_annotation/json_annotation.dart';
part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  String fname;
  String lname;
  String phone;
  String email;
  List<String> deviceIds;
  double totalEarnings;
  int completedJobs;
  int activeJobs;
  int rejectedJobs;
  double totalCleared;
  String stripeId;
  UserModel({
    this.email,
    this.fname,
    this.lname,
    this.phone,
    this.deviceIds,
    this.totalEarnings,
    this.activeJobs,
    this.completedJobs,
    this.rejectedJobs,
    this.totalCleared = 0,
    this.stripeId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

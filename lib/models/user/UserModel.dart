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

  UserModel({
    this.email,
    this.fname,
    this.lname,
    this.phone,
    this.deviceIds,
    this.totalEarnings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

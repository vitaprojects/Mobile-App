import 'package:json_annotation/json_annotation.dart';

part 'UserModelInPackage.g.dart';

@JsonSerializable()
class UserModelInPackage {
  String name;
  String mobile;
  UserModelInPackage({
    this.name,
    this.mobile,
  });

  factory UserModelInPackage.fromJson(Map<String, dynamic> json) =>
      _$UserModelInPackageFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelInPackageToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

// part 'UserInPackage.g.dart';

@JsonSerializable()
class UserInPackage {
  String name;
  String mobile;
  UserInPackage({
    this.name,
    this.mobile,
  });

  // factory UserInPackage.fromJson(Map<String, dynamic> json) =>
  //     _$UserInPackageFromJson(json);

  // Map<String, dynamic> toJson() => _$UserInPackageToJson(this);
}

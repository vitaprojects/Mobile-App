import 'package:json_annotation/json_annotation.dart';

// part 'LocationModel.g.dart';

@JsonSerializable()
class LocationModel {
  final DateTime dateTime;
  final String address;
  final double latitude;
  final double longitude;

  LocationModel({this.dateTime, this.address, this.latitude, this.longitude});

  // factory LocationModel.fromJson(Map<String, dynamic> json) =>
  //     _$LocationModelFromJson(json);

  // Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'LocationModel.g.dart';

@JsonSerializable()
class LocationModel {
  DateTime dateTime;
  String address;
  double latitude;
  double longitude;
  String terminal;
  String airport;

  LocationModel(
      {this.dateTime,
      this.address,
      this.latitude,
      this.longitude,
      this.terminal,
      this.airport});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

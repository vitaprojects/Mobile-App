import 'package:json_annotation/json_annotation.dart';

part 'FlightDetailsModel.g.dart';

@JsonSerializable()
class FlightDetailsModel {
  String ticketUrl;
  String flightNumber;
  String airLineNumber;
  FlightDetailsModel({
    this.ticketUrl,
    this.flightNumber,
    this.airLineNumber,
  });

  factory FlightDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FlightDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlightDetailsModelToJson(this);
}

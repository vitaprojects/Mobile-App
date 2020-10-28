import 'package:json_annotation/json_annotation.dart';
import 'package:newpostman1/models/travelTypes/TravelType.dart';

// part 'BusTravelType.g.dart';
@JsonSerializable()
class BusTravelType extends TravelType {
  int type;
  BusTravelType({
    this.type,
  });

  //     factory BusTravelType.fromJson(Map<String, dynamic> json) =>
  //     _$BusTravelTypeFromJson(json);

  // Map<String, dynamic> toJson() => _$BusTravelTypeToJson(this);

}

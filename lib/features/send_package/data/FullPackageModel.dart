import 'package:json_annotation/json_annotation.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
part 'FullPackageModel.g.dart';

@JsonSerializable()
class FullPackageModel {
  DateTime datePosted;
  String postedBy;
  // String docId;
  PackageModel packageModel;
  int status;

  FullPackageModel({
    this.postedBy,
    this.datePosted,
    this.packageModel,
    this.status,
    // this.docId,
  });

  factory FullPackageModel.fromJson(Map<String, dynamic> json) =>
      _$FullPackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$FullPackageModelToJson(this);
}

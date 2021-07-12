class CapabilitiesModel {
  CapabilitiesModel({
    this.transfers,
  });

  final String transfers;

  factory CapabilitiesModel.fromMap(Map<String, dynamic> json) =>
      CapabilitiesModel(
        transfers: json["transfers"],
      );

  Map<String, dynamic> toMap() => {
        "transfers": transfers,
      };
}

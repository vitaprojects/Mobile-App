import 'capabilitiesModel.dart';

class WithdrawModel {
  WithdrawModel({
    this.id,
    this.object,
    this.capabilities,
    this.chargesEnabled,
    this.country,
    this.created,
    this.defaultCurrency,
    this.detailsSubmitted,
    this.email,
    this.payoutsEnabled,
    this.type,
  });

  final String id;
  final String object;
  final CapabilitiesModel capabilities;
  final bool chargesEnabled;
  final String country;
  final int created;
  final String defaultCurrency;
  final bool detailsSubmitted;
  final String email;

  final bool payoutsEnabled;
  final String type;

  factory WithdrawModel.fromMap(Map<String, dynamic> json) => WithdrawModel(
        id: json["id"],
        object: json["object"],
        capabilities: CapabilitiesModel.fromMap(json["capabilities"]),
        chargesEnabled: json["charges_enabled"],
        country: json["country"],
        created: json["created"],
        defaultCurrency: json["default_currency"],
        detailsSubmitted: json["details_submitted"],
        email: json["email"],
        payoutsEnabled: json["payouts_enabled"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "object": object,
        "capabilities": capabilities.toMap(),
        "charges_enabled": chargesEnabled,
        "country": country,
        "created": created,
        "default_currency": defaultCurrency,
        "details_submitted": detailsSubmitted,
        "email": email,
        "payouts_enabled": payoutsEnabled,
        "type": type,
      };
}

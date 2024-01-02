// To parse this JSON data, do
//
//     final commodity = commodityFromJson(jsonString);

import 'dart:convert';

Commodity commodityFromJson(String str) => Commodity.fromJson(json.decode(str));

String commodityToJson(Commodity data) => json.encode(data.toJson());

class Commodity {
  bool? success;
  Map<String, int>? commodity;

  Commodity({
    this.success,
    this.commodity,
  });

  factory Commodity.fromJson(Map<String, dynamic> json) => Commodity(
        success: json["success"],
        commodity: Map.from(json["commodity"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "commodity":
            Map.from(commodity!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

// To parse this JSON data, do
//
//     final mandiData = mandiDataFromJson(jsonString);

import 'dart:convert';

MandiData mandiDataFromJson(String str) => MandiData.fromJson(json.decode(str));

String mandiDataToJson(MandiData data) => json.encode(data.toJson());

class MandiData {
    bool? success;
    List<Datum>? data;

    MandiData({
        this.success,
        this.data,
    });

    factory MandiData.fromJson(Map<String, dynamic> json) => MandiData(
        success: json["success"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? stateName;
    String? districtName;
    String? marketName;
    String? variety;
    String? group;
    String? arrivalsTonnes;
    String? minPriceRsQuintal;
    String? maxPriceRsQuintal;
    String? modalPriceRsQuintal;
    String? reportedDate;

    Datum({
        this.stateName,
        this.districtName,
        this.marketName,
        this.variety,
        this.group,
        this.arrivalsTonnes,
        this.minPriceRsQuintal,
        this.maxPriceRsQuintal,
        this.modalPriceRsQuintal,
        this.reportedDate,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stateName: json["State Name"],
        districtName: json["District Name"],
        marketName: json["Market Name"],
        variety: json["Variety"],
        group: json["Group"],
        arrivalsTonnes: json["Arrivals (Tonnes)"],
        minPriceRsQuintal: json["Min Price (Rs./Quintal)"],
        maxPriceRsQuintal: json["Max Price (Rs./Quintal)"],
        modalPriceRsQuintal: json["Modal Price (Rs./Quintal)"],
        reportedDate: json["Reported Date"],
    );

    Map<String, dynamic> toJson() => {
        "State Name": stateName,
        "District Name": districtName,
        "Market Name": marketName,
        "Variety": variety,
        "Group": group,
        "Arrivals (Tonnes)": arrivalsTonnes,
        "Min Price (Rs./Quintal)": minPriceRsQuintal,
        "Max Price (Rs./Quintal)": maxPriceRsQuintal,
        "Modal Price (Rs./Quintal)": modalPriceRsQuintal,
        "Reported Date": reportedDate,
    };
}

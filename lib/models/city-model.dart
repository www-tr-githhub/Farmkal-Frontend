// To parse this JSON data, do
//
//     final cityData = cityDataFromJson(jsonString);

import 'dart:convert';

CityData cityDataFromJson(String str) => CityData.fromJson(json.decode(str));

String cityDataToJson(CityData data) => json.encode(data.toJson());

class CityData {
  bool? success;
  CityList? cityList;

  CityData({
    this.success,
    this.cityList,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        success: json["success"],
        cityList: json["cityList"] == null
            ? null
            : CityList.fromJson(json["cityList"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "cityList": cityList?.toJson(),
      };
}

class CityList {
  String? select;
  String? ajmer;
  String? alwar;
  String? banswara;
  String? baran;
  String? barmer;
  String? bharatpur;
  String? bhilwara;
  String? bikaner;
  String? bundi;
  String? chittorgarh;
  String? churu;
  String? dausa;
  String? dholpur;
  String? dungarpur;
  String? ganganagar;
  String? hanumangarh;
  String? jaipur;
  String? jaisalmer;
  String? jalore;
  String? jhafarapatan;
  String? jhalawar;
  String? jhunjunu;
  String? jodhpur;
  String? karauli;
  String? kota;
  String? nagaur;
  String? pali;
  String? pratapgarh;
  String? rajasamand;
  String? sikar;
  String? sirohi;
  String? swaiMadhopur;
  String? tonk;
  String? udaipur;

  CityList({
    this.select,
    this.ajmer,
    this.alwar,
    this.banswara,
    this.baran,
    this.barmer,
    this.bharatpur,
    this.bhilwara,
    this.bikaner,
    this.bundi,
    this.chittorgarh,
    this.churu,
    this.dausa,
    this.dholpur,
    this.dungarpur,
    this.ganganagar,
    this.hanumangarh,
    this.jaipur,
    this.jaisalmer,
    this.jalore,
    this.jhafarapatan,
    this.jhalawar,
    this.jhunjunu,
    this.jodhpur,
    this.karauli,
    this.kota,
    this.nagaur,
    this.pali,
    this.pratapgarh,
    this.rajasamand,
    this.sikar,
    this.sirohi,
    this.swaiMadhopur,
    this.tonk,
    this.udaipur,
  });

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        select: json["--Select--"],
        ajmer: json["Ajmer"],
        alwar: json["Alwar"],
        banswara: json["Banswara"],
        baran: json["Baran"],
        barmer: json["Barmer"],
        bharatpur: json["Bharatpur"],
        bhilwara: json["Bhilwara"],
        bikaner: json["Bikaner"],
        bundi: json["Bundi"],
        chittorgarh: json["Chittorgarh"],
        churu: json["Churu"],
        dausa: json["Dausa"],
        dholpur: json["Dholpur"],
        dungarpur: json["Dungarpur"],
        ganganagar: json["Ganganagar"],
        hanumangarh: json["Hanumangarh"],
        jaipur: json["Jaipur"],
        jaisalmer: json["Jaisalmer"],
        jalore: json["Jalore"],
        jhafarapatan: json["Jhafarapatan"],
        jhalawar: json["Jhalawar"],
        jhunjunu: json["Jhunjunu"],
        jodhpur: json["Jodhpur"],
        karauli: json["Karauli"],
        kota: json["Kota"],
        nagaur: json["Nagaur"],
        pali: json["Pali"],
        pratapgarh: json["Pratapgarh"],
        rajasamand: json["Rajasamand"],
        sikar: json["Sikar"],
        sirohi: json["Sirohi"],
        swaiMadhopur: json["Swai Madhopur"],
        tonk: json["Tonk"],
        udaipur: json["Udaipur"],
      );

  Map<String, dynamic> toJson() => {
        "--Select--": select,
        "Ajmer": ajmer,
        "Alwar": alwar,
        "Banswara": banswara,
        "Baran": baran,
        "Barmer": barmer,
        "Bharatpur": bharatpur,
        "Bhilwara": bhilwara,
        "Bikaner": bikaner,
        "Bundi": bundi,
        "Chittorgarh": chittorgarh,
        "Churu": churu,
        "Dausa": dausa,
        "Dholpur": dholpur,
        "Dungarpur": dungarpur,
        "Ganganagar": ganganagar,
        "Hanumangarh": hanumangarh,
        "Jaipur": jaipur,
        "Jaisalmer": jaisalmer,
        "Jalore": jalore,
        "Jhafarapatan": jhafarapatan,
        "Jhalawar": jhalawar,
        "Jhunjunu": jhunjunu,
        "Jodhpur": jodhpur,
        "Karauli": karauli,
        "Kota": kota,
        "Nagaur": nagaur,
        "Pali": pali,
        "Pratapgarh": pratapgarh,
        "Rajasamand": rajasamand,
        "Sikar": sikar,
        "Sirohi": sirohi,
        "Swai Madhopur": swaiMadhopur,
        "Tonk": tonk,
        "Udaipur": udaipur,
      };
}

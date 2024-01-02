// To parse this JSON data, do
//
//     final marketData = marketDataFromJson(jsonString);

import 'dart:convert';

MarketData marketDataFromJson(String str) =>
    MarketData.fromJson(json.decode(str));

String marketDataToJson(MarketData data) => json.encode(data.toJson());

class MarketData {
  bool? success;
  MarketList? marketList;

  MarketData({
    this.success,
    this.marketList,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        success: json["success"],
        marketList: json["marketList"] == null
            ? null
            : MarketList.fromJson(json["marketList"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "marketList": marketList?.toJson(),
      };
}

class MarketList {
  String? select;
  String? bahrawandakhurd;
  String? bakani;
  String? bhadoti;
  String? bhiya;
  String? boli;
  String? chechat;
  String? chitava;
  String? chothKaBarwara;
  String? hindoli;
  String? itawa;
  String? jaydeepBhandaranWarehouse;
  String? kapren;
  String? khandar;
  String? kishanpuraBorda;
  String? kota;
  String? kotaFv;
  String? kotaMandana;
  String? kundanpur;
  String? mangrole;
  String? manohararthana;
  String? palaytha;
  String? panwar;
  String? pirawa;
  String? ramaganjMandi;
  String? ramgangMandiBapawarkala;
  String? ramgangMandiSamod;
  String? ratlai;
  String? sangod;
  String? sarolakalan;
  String? siswali;
  String? sitapura;
  String? sultanpur;

  MarketList({
    this.select,
    this.bahrawandakhurd,
    this.bakani,
    this.bhadoti,
    this.bhiya,
    this.boli,
    this.chechat,
    this.chitava,
    this.chothKaBarwara,
    this.hindoli,
    this.itawa,
    this.jaydeepBhandaranWarehouse,
    this.kapren,
    this.khandar,
    this.kishanpuraBorda,
    this.kota,
    this.kotaFv,
    this.kotaMandana,
    this.kundanpur,
    this.mangrole,
    this.manohararthana,
    this.palaytha,
    this.panwar,
    this.pirawa,
    this.ramaganjMandi,
    this.ramgangMandiBapawarkala,
    this.ramgangMandiSamod,
    this.ratlai,
    this.sangod,
    this.sarolakalan,
    this.siswali,
    this.sitapura,
    this.sultanpur,
  });

  factory MarketList.fromJson(Map<String, dynamic> json) => MarketList(
        select: json["--Select--"],
        bahrawandakhurd: json["Bahrawandakhurd"],
        bakani: json["Bakani"],
        bhadoti: json["Bhadoti"],
        bhiya: json["Bhiya"],
        boli: json["Boli"],
        chechat: json["Chechat"],
        chitava: json["Chitava"],
        chothKaBarwara: json["Choth ka barwara"],
        hindoli: json["Hindoli"],
        itawa: json["Itawa"],
        jaydeepBhandaranWarehouse: json["Jaydeep Bhandaran(warehouse) "],
        kapren: json["Kapren"],
        khandar: json["Khandar"],
        kishanpuraBorda: json["Kishanpura borda"],
        kota: json["Kota"],
        kotaFv: json["Kota (FV)"],
        kotaMandana: json["Kota(Mandana)"],
        kundanpur: json["Kundanpur"],
        mangrole: json["Mangrole"],
        manohararthana: json["Manohararthana"],
        palaytha: json["Palaytha"],
        panwar: json["Panwar"],
        pirawa: json["Pirawa "],
        ramaganjMandi: json["Ramaganj Mandi"],
        ramgangMandiBapawarkala: json["Ramgang Mandi(Bapawarkala)"],
        ramgangMandiSamod: json["Ramgang Mandi(Samod)"],
        ratlai: json["Ratlai"],
        sangod: json["Sangod"],
        sarolakalan: json["Sarolakalan"],
        siswali: json["Siswali"],
        sitapura: json["Sitapura"],
        sultanpur: json["Sultanpur"],
      );

  Map<String, dynamic> toJson() => {
        "--Select--": select,
        "Bahrawandakhurd": bahrawandakhurd,
        "Bakani": bakani,
        "Bhadoti": bhadoti,
        "Bhiya": bhiya,
        "Boli": boli,
        "Chechat": chechat,
        "Chitava": chitava,
        "Choth ka barwara": chothKaBarwara,
        "Hindoli": hindoli,
        "Itawa": itawa,
        "Jaydeep Bhandaran(warehouse) ": jaydeepBhandaranWarehouse,
        "Kapren": kapren,
        "Khandar": khandar,
        "Kishanpura borda": kishanpuraBorda,
        "Kota": kota,
        "Kota (FV)": kotaFv,
        "Kota(Mandana)": kotaMandana,
        "Kundanpur": kundanpur,
        "Mangrole": mangrole,
        "Manohararthana": manohararthana,
        "Palaytha": palaytha,
        "Panwar": panwar,
        "Pirawa ": pirawa,
        "Ramaganj Mandi": ramaganjMandi,
        "Ramgang Mandi(Bapawarkala)": ramgangMandiBapawarkala,
        "Ramgang Mandi(Samod)": ramgangMandiSamod,
        "Ratlai": ratlai,
        "Sangod": sangod,
        "Sarolakalan": sarolakalan,
        "Siswali": siswali,
        "Sitapura": sitapura,
        "Sultanpur": sultanpur,
      };
}

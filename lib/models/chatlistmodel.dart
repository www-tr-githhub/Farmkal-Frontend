// To parse this JSON data, do
//
//     final chatlist = chatlistFromJson(jsonString);

import 'dart:convert';

Chatlist chatlistFromJson(String str) => Chatlist.fromJson(json.decode(str));

String chatlistToJson(Chatlist data) => json.encode(data.toJson());

class Chatlist {
  bool? success;
  List<EmailList>? emailList;

  Chatlist({
    this.success,
    this.emailList,
  });

  factory Chatlist.fromJson(Map<String, dynamic> json) => Chatlist(
        success: json["success"],
        emailList: json["emailList"] == null
            ? []
            : List<EmailList>.from(
                json["emailList"]!.map((x) => EmailList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "emailList": emailList == null
            ? []
            : List<dynamic>.from(emailList!.map((x) => x.toJson())),
      };
}

class EmailList {
  String? email;
  String? name;

  EmailList({
    this.email,
    this.name,
  });

  factory EmailList.fromJson(Map<String, dynamic> json) => EmailList(
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
      };
}

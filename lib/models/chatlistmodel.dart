// To parse this JSON data, do
//
//     final chatList = chatListFromJson(jsonString);

import 'dart:convert';

ChatList chatListFromJson(String str) => ChatList.fromJson(json.decode(str));

String chatListToJson(ChatList data) => json.encode(data.toJson());

class ChatList {
  bool? success;
  List<EmailList>? emailList;

  ChatList({
    this.success,
    this.emailList,
  });

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
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
  String? objId;
  String? name;
  String? phone;

  EmailList({
    this.objId,
    this.name,
    this.phone,
  });

  factory EmailList.fromJson(Map<String, dynamic> json) => EmailList(
        objId: json["ObjId"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "ObjId": objId,
        "name": name,
        "phone": phone,
      };
}

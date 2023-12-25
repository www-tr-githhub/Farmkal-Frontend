// To parse this JSON data, do
//
//     final chatData = chatDataFromJson(jsonString);

import 'dart:convert';

ChatData chatDataFromJson(String str) => ChatData.fromJson(json.decode(str));

String chatDataToJson(ChatData data) => json.encode(data.toJson());

class ChatData {
  bool? success;
  List<ChatDatum>? chatData;

  ChatData({
    this.success,
    this.chatData,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        success: json["success"],
        chatData: json["chatData"] == null
            ? []
            : List<ChatDatum>.from(
                json["chatData"]!.map((x) => ChatDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "chatData": chatData == null
            ? []
            : List<dynamic>.from(chatData!.map((x) => x.toJson())),
      };
}

class ChatDatum {
  String? message;
  int? time;
  String? type;

  ChatDatum({
    this.message,
    this.time,
    this.type,
  });

  factory ChatDatum.fromJson(Map<String, dynamic> json) => ChatDatum(
        message: json["message"],
        time: json["time"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "time": time,
        "type": type,
      };
}

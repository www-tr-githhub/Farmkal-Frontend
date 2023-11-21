import 'dart:convert';

import 'package:farmkal/models/MessageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPreferences {
  // final key = 'chatMessages';

  // Future<bool> saveChat(List<MessageModel> responseModel, String? key) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   final jsonList = responseModel.map((message) => message.toJson()).toList();
  //   return await sp.setString(key!, jsonEncode(jsonList));
  // }

  // Future<List<MessageModel>> getChats(String? key) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   final jsonString = sp.getString(key!);

  //   if (jsonString != null) {
  //     final jsonList = jsonDecode(jsonString) as List<dynamic>;
  //     final chatMessages = jsonList
  //         .map((json) => MessageModel.fromJson(json as Map<String, dynamic>))
  //         .toList();
  //     return chatMessages;
  //   } else {
  //     return []; // Return an empty list if no data is found in SharedPreferences.
  //   }
  // }
}

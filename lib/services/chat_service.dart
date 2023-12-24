import 'dart:convert';

import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/chatdata-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';
import '../models/chatlist-model.dart';

class ChatService {
  final _chatService = NetworkApiServices();

  Future<ChatList> chatlistdata(var data, String token) async {
    dynamic response =
        await _chatService.postDataWithToken(data, token, AppUrl.chatList);

    print(response);
    return ChatList.fromJson(response);
  }

  Future<ChatData> chatingdata(var data, String token) async {
    dynamic response =
        await _chatService.postDataWithToken(data, token, AppUrl.chatData);

    print(response);
    return ChatData.fromJson(response);
  }

  Future<void> sendMessage(String message, String token) async {
    final response = await _chatService.postDataWithToken(
      {'message': message},
      token,
      'https://cr5pww-4000.csb.app/api/v1/chat',
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to send message.');
    }
  }
}

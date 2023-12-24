import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/chatdata-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';

import '../models/chatlist-model.dart';

class ChatService {
  final _chatService = NetworkApiServices();

  Future<ChatList> chatlistdata(String token) async {
    dynamic response =
        await _chatService.getApiwithtoken(AppUrl.chatList, token, '');

    print(response);
    return ChatList.fromJson(response);
  }

  Future<ChatData> chatingdata(String token, String roomId) async {
    dynamic response =
        await _chatService.getApiwithtoken(AppUrl.chatData, token, roomId);

    print(response);
    return ChatData.fromJson(response);
  }
}

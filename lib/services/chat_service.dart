import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/chatdata-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';

import '../models/chatlist-model.dart';

class ChatService {
  final _chatService = NetworkApiServices();

  Future<ChatList> chatlistdata(var data) async {
    dynamic response = await _chatService.postApi(data, AppUrl.chatList);

    print(response);
    return ChatList.fromJson(response);
  }

  Future<ChatData> chatingdata(var data) async {
    dynamic response = await _chatService.postApi(data, AppUrl.chatData);

    print(response);
    return ChatData.fromJson(response);
  }
}

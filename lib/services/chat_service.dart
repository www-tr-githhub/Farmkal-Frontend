import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/chatdata-model.dart';
import 'package:farmkal/models/userList-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';

import '../models/chatlist-model.dart';

class ChatService {
  final _chatService = NetworkApiServices();

  Future<UserList> chatlistdata(String token) async {
    print("${token} token ye hai ");
    dynamic response = await _chatService.getApi(AppUrl.userList);

    print(" ye hai response${response} ");
    print("hello world");

    return UserList.fromJson(response);
  }

  Future<ChatData> chatingdata(String token, String roomId) async {
    print("$roomId room id ");
    dynamic response =
        await _chatService.getApiwithtoken(AppUrl.chatData, token, roomId);

    print(response);
    return ChatData.fromJson(response);
  }
}

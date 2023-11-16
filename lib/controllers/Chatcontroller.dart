import 'dart:io';

import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/MessageModel.dart';
import 'package:farmkal/services/chat_service.dart';
import 'package:farmkal/view_models/ChatPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final _api = ChatService();
  RxBool loading = false.obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  late IO.Socket socket;
  RxInt roomIndex = 0.obs;
  final messageController = TextEditingController().obs;
  RxList<MessageModel> mes = <MessageModel>[].obs;
  final ChatPreferences _chatPreferences = ChatPreferences();
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  ScrollController scrollController = ScrollController();
  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io("http://4.246.192.231", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      "path": "/chatSocket",
    });
    socket.connect();
    // _userPreferences.getUserId().then((value) {
    //   socket.emit("signin", value.toString());
    // });
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"], roomIndex.value);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(
      String messageText, String sourceId, String targetId, int roomIndex) {
    messageController.value.clear();

    print('$messageText + $sourceId + $targetId');
    // setMessage("source", messageText, roomIndex);
    messageText = messageText.trim();
    if (messageText.isNotEmpty) {
      setMessage("source", messageText, roomIndex);
      socket.emit("message", {
        "message": messageText,
        "sourceId": sourceId,
        "targetId": targetId,
        "roomIndex": roomIndex
      });
    }
  }

  void setMessage(String type, String message, int roomIndex) {
    MessageModel message0 = MessageModel(message: message, type: type);

    mes.add(message0);
    // _chatPreferences.saveChat(mes, chatDetail.value.rooms?[roomIndex].id);
    _chatPreferences.saveChat(mes, "messageid");
  }
  // Future<void> saveChats() async {
  //   final userId = await _userPreferences.getUserId();

  //   for (final room in chatDetail.value.rooms!) {
  //     final roomId = room.id;
  //     // Map data
  //     var data = <String, String>{};
  //     data['roomId'] = room.id.toString();
  //     data['page'] = 0.toString();
  //     await getchats(roomId, 0, data);

  //     print(chatHistory);

  //     final messages = chatHistory
  //         .map((message) => MessageModel(
  //               type: message.senderId == userId ? "source" : "destination",
  //               message: message.message ?? "",
  //             ))
  //         .toList();
  //     print(messages);
  //     // messages.reversed.toList();

  //     await _chatPreferences.saveChat(messages, roomId);
  //     await _chatPreferences.getChats(roomId).then((value) => {
  //           value.map((e) => {print(e.message)})
  //         });
  //     print("Message Saved");
  //   }
  // }
}

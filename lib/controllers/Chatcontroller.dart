import 'dart:io';

import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/MessageModel.dart';
import 'package:farmkal/models/chatdata-model.dart';
import 'package:farmkal/models/chatlist-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';
import 'package:farmkal/services/chat_service.dart';
import 'package:farmkal/view_models/ChatPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../utils/utils.dart';

class ChatController extends GetxController {
  final _api = ChatService();
  RxBool loading = false.obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  IO.Socket socket = IO.io("${AppUrl.BaseUrl}", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
    "path": "/chatSocket",
  });
  RxInt roomIndex = 0.obs;
  final messageController = TextEditingController().obs;
  RxList<MessageModel> mes = <MessageModel>[].obs;
  final ChatPreferences _chatPreferences = ChatPreferences();
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<ChatList> chatlist = ChatList().obs;
  void setChatList(ChatList value) => chatlist.value = value;

  Rx<ChatData> chatingdata = ChatData().obs;
  void setChatdata(ChatData value) => chatingdata.value = value;

  ScrollController scrollController = ScrollController();
  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    // socket =
    print("inside connection");
    socket.connect();
    // _userPreferences.getUserId().then((value) {
    //   socket.emit("signin", value.toString());
    // });
    socket.onConnect((data) {
      print("Connected");
    });

    socket.on("message", (msg) {
      print(msg);
      setMessage("destination", msg["message"], roomIndex.value);
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
    print("${socket.connected} not connected backend issue");
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
    // _chatPreferences.saveChat(mes, "messageid");
  }

  void disconnect() {
    if (socket != null && socket.connected == true) {
      print("disconnected");
      socket.disconnect();
    } else {
      print("The socket was not connected");
    }
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

  Future<void> getchatlist() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;

    var data = {
      "myEmail": "him1@g.com",
    };
    print(data);
    try {
      final response = await _api.chatlistdata(data);
      setChatList(response);
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }

  Future<void> getchatdata(String sourceId, String targetId) async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;

    // var data = {"myEmail": sourceId, "friendEmail": targetId};
    var data = {"myEmail": "him1@g.com", "friendEmail": "harshit@g.com"};

    print(data);
    try {
      final response = await _api.chatingdata(data);
      setChatdata(response);
      for (int i = 0; i < chatingdata.value.chatData!.length; i++) {
        if (chatingdata.value.chatData![i].type == "post") {
          print("${chatingdata.value.chatData![i].message!}");
          setMessage("source", chatingdata.value.chatData![i].message!, 0);
          print("message got set");
        } else {
          setMessage("destination", chatingdata.value.chatData![i].message!, 0);
        }
      }
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }
}

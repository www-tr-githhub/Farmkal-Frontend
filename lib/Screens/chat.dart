import 'package:farmkal/Screens/chatscreen.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatController _chatController = Get.find<ChatController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _chatController.getchatlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _chatController.disconnect();
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(title: Text("Chats")),
          body: Obx(() {
            if (_chatController.rxRequestStatus.value == Status.LOADING) {
              return Center(child: CircularProgressIndicator());
            } else if (_chatController.rxRequestStatus.value == Status.ERROR) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('No Internet')),
                );
              });
              return Container();
            } else if (_chatController.rxRequestStatus.value ==
                Status.COMPLETED) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Search......",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    if (_chatController.chatlist.value.emailList != null)
                      for (var i = 0;
                          i < _chatController.chatlist.value.emailList!.length;
                          i++)
                        UserChat(
                            _chatController.chatlist.value.emailList![i].name!,
                            _chatController
                                .chatlist.value.emailList![i].email!),
                  ]),
                ),
              );
            } else {
              return Container();
            }
          })),
    );
  }
}

Widget UserChat(String name, String email) {
  return ListTile(
    onTap: () {
      Get.to(ChatScreen(
        targetId: email,
        sourceId: 'him1@g.com',
        targetname: name,
        roomindex: 0,
        userimage:
            'https://cdn.pixabay.com/photo/2019/11/19/07/18/network-4636686_640.jpg',
      ));
    },
    leading: CircleAvatar(
      backgroundImage: AssetImage('assets/gif/images.jpeg'),
    ),
    title: Text(name),
    subtitle: Text("Last Message"),
    trailing: Text("Time"),
  );
}

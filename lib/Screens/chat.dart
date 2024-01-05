import 'package:farmkal/Screens/chatscreen.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/controllers/login_controller.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController _chatController = Get.find<ChatController>();
  LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _chatController.getchatlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_chatController.rxRequestStatus.value);
    return WillPopScope(
      onWillPop: () async {
        _chatController.disconnect();

        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Chats")),
        body: Obx(
          () {
            switch (_chatController.rxRequestStatus.value) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Utils.SnackBar('No Internet', 'No Internet');
              case Status.COMPLETED:
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
                      _chatController.chatlist.value.users != null
                          ? Column(
                              children: List<Widget>.generate(
                                  _chatController.chatlist.value.users!.length,
                                  (i) => UserChat(
                                      _chatController
                                              .chatlist.value.users![i].name ??
                                          "hello",
                                      _chatController
                                              .chatlist.value.users![i].id ??
                                          "id",
                                      _chatController
                                              .chatlist.value.users![i].phone ??
                                          "1234",
                                      _loginController
                                              .userDetails.value.user!.id ??
                                          "1234",
                                      _chatController
                                              .chatlist.value.users![i].id ??
                                          "1234")))
                          : Container(), // Placeholder widget
                    ]),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

Widget UserChat(String name, String email, String usernumber, String sourceId,
    String targetId) {
  return ListTile(
    onTap: () {
      print(email);
      Get.to(ChatScreen(
        targetId: targetId,
        sourceId: sourceId,
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
    subtitle: Text("Last Message $usernumber"),
    trailing: Text("Time"),
  );
}

import 'package:farmkal/Screens/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body: Padding(
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
            UserChat(),
            for (var i = 0; i < 10; i++) UserChat(),
          ]),
        ),
      ),
    );
  }

  Widget UserChat() {
    return ListTile(
      onTap: () {
        Get.to(ChatScreen(
          targetId: '1234',
          sourceId: '5678',
          targetname: 'Name', roomindex: 0, userimage: 'https://cdn.pixabay.com/photo/2019/11/19/07/18/network-4636686_640.jpg',
        ));
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/gif/images.jpeg'),
      ),
      title: Text("Name"),
      subtitle: Text("Last Message"),
      trailing: Text("Time"),
    );
  }
}

import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  ChatController _chatController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmKal"),
      ),
      body: SafeArea(
          child: Center(
        child: Text(
          "Coming soon",
          textAlign: TextAlign.center,
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 35,
            ),
            Icon(
              Icons.shop,
              size: 35,
            ),
            IconButton(
                onPressed: () {
                  _chatController.connect();
                  Get.to(() => ChatPage());
                },
                icon: Icon(
                  Icons.chat_bubble,
                  color: Color.fromARGB(255, 42, 42, 42),
                  size: 35,
                )),
            /*FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  Get.to(() => ChatPage());
                },
                child: Icon(Icons.chat_bubble)),*/
            FloatingActionButton(
                backgroundColor: Appcolor.greencolor,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
                onPressed: () {
                  Get.to(() => PageControllerApp());
                })
          ],
        ),
      ),
    );
  }
}

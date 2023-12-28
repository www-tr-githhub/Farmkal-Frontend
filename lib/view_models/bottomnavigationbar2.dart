import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/app_localizations.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bottomnavigationbar2 extends StatefulWidget {
  @override
  _Bottomnavigationbar2State createState() => _Bottomnavigationbar2State();
}

class _Bottomnavigationbar2State extends State<Bottomnavigationbar2> {
  ChatController _chatController = Get.find<ChatController>();
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Appcolor.darkbrowncolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.account_circle_sharp,
                  color: Appcolor.whitecolor, size: 35),
              IconButton(
                onPressed: () {
                  _chatController.connect("him1@g.com");
                  Get.to(() => ChatPage());
                },
                icon: Icon(Icons.chat_bubble, color: Colors.white, size: 35),
              ),
              Icon(Icons.add, color: Colors.white, size: 35),
              Icon(Icons.favorite, color: Colors.white, size: 35),
              FloatingActionButton(
                backgroundColor: Appcolor.greencolor,
                child: Icon(Icons.arrow_forward, color: Colors.white),
                shape: CircleBorder(),
                onPressed: () {
                  Get.to(() => PageControllerApp());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

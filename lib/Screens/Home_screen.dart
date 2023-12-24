import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/app_localizations.dart';
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

  Widget rowview(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            'assets/gif/Tractor.jpeg',
            width: 110,
            height: 80,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Appcolor.browncolor,
          leading: OverflowBox(
            minWidth: 0,
            maxWidth: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    radius: 20,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          title: Text("RAM KUMAR"),
          actions: [
            IconButton(
              icon: Icon(Icons.search), // This is the search icon
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu), // This is the menu icon
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.translate('Things available'),
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                rowview(AppLocalizations.of(context)!.translate('Tractor')),
                rowview('Trolly'),
                rowview('Cultivator'),
              ],
            ),
            Row(
              children: [
                rowview('Tractor'),
                rowview('Trolly'),
                rowview('tractors'),
              ],
            ),
            Text(
              AppLocalizations.of(context)!.translate('Recently added items'),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
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

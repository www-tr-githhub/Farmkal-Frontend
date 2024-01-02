import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/Screens/seller.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class mandipage extends StatefulWidget {
  @override
  _mandipageState createState() => _mandipageState();
}

class _mandipageState extends State<mandipage> {
  ChatController _chatController = Get.find<ChatController>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.notifications), // This is the menu icon
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                buttonbox("मंडी के हिसाब से"),
                SizedBox(
                  width: 24,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      size: 30,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 12,
                ),
                InkWell(
                  child: buttonbox(" चैट करेफसल के हिसाब से "),
                  onTap: () {
                    Get.to(ChatPage());
                  },
                ),
              ],
            )
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
              IconButton(
                  onPressed: () {
                    Get.to(() => PageControllerApp());
                  },
                  icon: Icon(Icons.account_circle_sharp,
                      color: Appcolor.whitecolor, size: 32)),
              IconButton(
                onPressed: () {
                  _chatController.connect("him1@g.com");
                  Get.to(() => ChatPage());
                },
                icon: Icon(Icons.chat_bubble, color: Colors.white, size: 35),
              ),
              IconButton(
                  onPressed: () {
                    Get.to(Sellerview());
                  },
                  icon: Icon(Icons.add, color: Colors.white, size: 35)),
              Icon(Icons.favorite, color: Colors.white, size: 35),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart,
                      color: Appcolor.greencolor, size: 35)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonbox(String title) {
    return Container(
        height: 50,
        width: 150,
        color: Colors.brown,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 15, color: Appcolor.whitecolor),
          ),
        ));
  }
}

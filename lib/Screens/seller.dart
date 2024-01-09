import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/controllers/textcontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Sellerview extends StatefulWidget {
  @override
  _SellerviewState createState() => _SellerviewState();
}

class _SellerviewState extends State<Sellerview> {
  ChatController _chatController = Get.find<ChatController>();
  final T_Controller controller = Get.put(T_Controller());

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Center(
                child: Image.asset('assets/gif/bluetractor.jpeg'),
              )),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                )),
            Table(
              defaultColumnWidth: FixedColumnWidth(180),
              border: TableBorder.all(width: 2.0, style: BorderStyle.solid),
              children: [
                TableRow(children: [
                  Column(
                    children: [Text("MODEL", style: TextStyle(fontSize: 20))],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Enter Text'),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [Text("BRAND", style: TextStyle(fontSize: 20))],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Enter Text'),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [Text("TYRE", style: TextStyle(fontSize: 20))],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Enter Text'),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      Text("RATE/ DEMAND", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Enter Text'),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [Text("HOURS", style: TextStyle(fontSize: 20))],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Enter Text'),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      Text("OTHER DETAILS", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(labelText: 'Enter Text'),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.brown,
                  child: Center(
                    child: Text(
                      "UPLOAD NOW",
                      style:
                          TextStyle(fontSize: 15, color: Appcolor.whitecolor),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
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
                  // _chatController.connect("him1@g.com");
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
}

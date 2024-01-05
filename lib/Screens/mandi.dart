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
  Widget mandibox(String title, String imagePath, String title2) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Appcolor.browncolor,
      width: 390.0,
      height: 150.0,
      child: Column(
        children: [
          Container(
            /*  child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imagePath),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                      Text(title2),
                    ],
                  ),
                ),
                Positioned(
                  right: 40,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.location_pin)),
                ),
              ],
            ),

*/
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    Text(title2),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.location_pin)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowline("अधिकतम", "18000/Q"),
                rowline("अधिकतम", "18000/Q"),
                rowline("अधिकतम", "18000/Q"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDDACF),
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonbox("मंडी के हिसाब से"),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      size: 30,
                      color: Colors.black,
                    )),
                InkWell(
                  child: buttonbox(" चैट करेफसल के हिसाब से "),
                  onTap: () {
                    Get.to(ChatPage());
                  },
                ),
              ],
            ),
            // Row(
            //   children: [
            SizedBox(
              height: 10,
            ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Column(
            //       children: [
            mandibox("लहसुन ", "assets/gif/garlic.jpeg", "(आवक - 250  टन) "),
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   children: [
            mandibox("प्याज  ", "assets/gif/garlic.jpeg", "(आवक - 300  टन)  "),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   children: [
            mandibox("गेहू   ", "assets/gif/garlic.jpeg", "(आवक - 150  टन)  "),
            //   ],
            // ),
            SizedBox(
              height: 10,
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          height: 50,
          width: 160,
          color: Colors.brown,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 15, color: Appcolor.whitecolor),
            ),
          )),
    );
  }

  Widget rowline(String title, String title2) {
    return Row(
      children: [
        Column(
          children: [
            Text(title),
            Container(
              child: Text(title2),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/Screens/mandi.dart';
import 'package:farmkal/Screens/productpage.dart';
import 'package:farmkal/Screens/seller.dart';
import 'package:farmkal/app_localizations.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';

import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:farmkal/view_models/userPrefrence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mandiController.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  ChatController _chatController = Get.find<ChatController>();
  MandiController _mandiController = Get.put(MandiController());

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

  Widget mandi(String title) {
    return Column(
      children: [
        Icon(
          Icons.arrow_upward,
          color: Colors.white,
          size: 8,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 8),
        ),
      ],
    );
  }

  Widget filter(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              color: Appcolor.browncolor,
              child: Text(
                title,
                style: TextStyle(fontSize: 12),
              )),
        ],
      ),
    );
  }

  Widget recentimage(String title, name, info) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkResponse(
        onTap: () {
          Get.to(() => Productpage());
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // Set border color
              width: 4.0, // Set border width
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) // Set rounded corner radius
                ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/gif/bluetractor.jpeg',
                width: 180,
                height: 120,
              ),
              Text(title),
              Text(name),
              Row(
                children: [
                  Text(info),
                  IconButton(onPressed: () {}, icon: Icon(Icons.phone))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Appcolor.browncolor,
          leading: OverflowBox(
            minWidth: 0,
            maxWidth: double.infinity,
            child: Column(
              children: [
                Row(
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
              ],
            ),
          ),
          title: Text("RAM KUMAR"),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search), // This is the search icon
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.menu), // This is the menu icon
                      onPressed: () {},
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      mandi("गेहू "),
                    ],
                  ),
                )
              ],
            ),
            /*IconButton(
              icon: Icon(Icons.menu), // This is the menu icon
              onPressed: () {},
            ),
            Row(
              children: [
                mandi("गेहू "),
              ],
            )*/
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
                rowview(AppLocalizations.of(context)!.translate('Trolly')),
                rowview(AppLocalizations.of(context)!.translate('Cultivator')),
              ],
            ),
            Row(
              children: [
                rowview('सीड ड्रिल '),
                rowview('रोटावेटर'),
                rowview('सभी देखे '),
              ],
            ),
            Text(
              AppLocalizations.of(context)!.translate('Recently added items'),
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                filter('CHITTORGARH'),
                filter('MODEL 2015-2020'),
                filter('RANGE40-45HP'),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "More Filter",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Icon(Icons.filter_alt_outlined)
                      /*IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_alt_outlined)),*/
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                recentimage('2,50,000/ चित्तोडगढ़ ', 'MAHINDRA ', '475 2015'),
                recentimage('3,50,000/उदयपुर ', 'SONALIKA ', '735DI 2019'),
              ],
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
              /*Icon(Icons.account_circle_sharp,
                  color: Appcolor.whitecolor, size: 35),*/

              IconButton(
                  onPressed: () {
                    Get.to(() => PageControllerApp());
                  },
                  icon: Icon(Icons.account_circle_sharp,
                      color: Appcolor.whitecolor, size: 32)),
              IconButton(
                onPressed: () async {
                  String? token = await UserPreference().getToken();
                  print(token);
                  if (token == null) {
                    print("hello tanisha");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Login'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                  "You have to login or Register first to start chatting")
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Login'),
                              onPressed: () {
                                Get.to(() => PageControllerApp());
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // _chatController.connect("him1@g.com");
                    Get.to(() => ChatPage());
                  }
                },
                icon: Icon(Icons.chat_bubble, color: Colors.white, size: 35),
              ),
              Icon(Icons.add, color: Colors.white, size: 35),
              GestureDetector(
                  onTap: () {
                    _mandiController.getCityData();
                    _mandiController.getMarketDatamethod();
                    _mandiController.getCommidityData();
                  },
                  child: Icon(Icons.favorite, color: Colors.white, size: 35)),
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

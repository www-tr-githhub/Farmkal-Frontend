import 'package:farmkal/Screens/Home_screen.dart';
import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/Screens/mandi.dart';
import 'package:farmkal/Screens/profile.dart';
import 'package:farmkal/Screens/seller.dart';
import 'package:farmkal/app_localizations.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/controllers/login_controller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:farmkal/view_models/userPrefrence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bottomnavigationbar2 extends StatefulWidget {
  @override
  _Bottomnavigationbar2State createState() => _Bottomnavigationbar2State();
}

class _Bottomnavigationbar2State extends State<Bottomnavigationbar2> {
  ChatController _chatController = Get.put(ChatController());
  LoginController _loginController = Get.put(LoginController());

  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: _loginController.selectedIndex.value,
          children: [
            // _loginController.selectedIndex.value == 0 ? HomeScreen1() : Container(),
            _loginController.selectedIndex.value == 0
                // ? const LaunchHome()
                //
                // ? HomeScreenAleart1()
                //? HomeScreenAleart2()
                //
                //
                ? Home_Screen(
                    // filter: _filter,
                    // homecenter: _homecenter,
                    )
                : Container(),
            _loginController.selectedIndex.value == 1
                ? ChatPage()
                : Container(),
            _loginController.selectedIndex.value == 2
                // <<<<<<< yashD
                //                   ? AddHome()
                // =======

                ? Sellerview()
                // ? MeetupPreference()
                // >>>>>>> main
                : Container(),
            _loginController.selectedIndex.value == 3
                ? Sellerview()
                : Container(),
            _loginController.selectedIndex.value == 4
                ? mandipage()
                : Container(),
          ],
        );
      }),
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
                  onPressed: () async {
                    String? token = await UserPreference().getToken();
                    print(token);
                    if (token == null ||
                        token.isEmpty ||
                        _loginController.userDetails.value.user == null) {
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
                      _loginController.selectedIndex.value = 0;
                      Get.to(() => ProfilePage());
                    }
                  },
                  icon: Icon(Icons.account_circle_sharp,
                      color: Appcolor.whitecolor, size: 32)),
              IconButton(
                onPressed: () async {
                  String? token = await UserPreference().getToken();
                  print(token);
                  if (token == null ||
                      token.isEmpty ||
                      _loginController.userDetails.value.user == null) {
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
                    _loginController.selectedIndex.value = 1;

                    // _chatController.connect("him1@g.com");
                    // Get.to(() => ChatPage());
                  }
                },
                icon: Icon(Icons.chat_bubble, color: Colors.white, size: 35),
              ),
              IconButton(
                  onPressed: () async {
                    String? token = await UserPreference().getToken();
                    print(token);
                    if (token == null ||
                        token.isEmpty ||
                        _loginController.userDetails.value.user == null) {
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
                      _loginController.selectedIndex.value = 3;

                      // Get.to(Sellerview());
                    }
                  },
                  icon: Icon(Icons.add, color: Colors.white, size: 35)),
              GestureDetector(
                  onTap: () {
                    // _mandiController.getCityData();
                    // _mandiController.getMarketDatamethod();
                    // _mandiController.getCommidityData();
                  },
                  child: Icon(Icons.favorite, color: Colors.white, size: 35)),
              IconButton(
                  onPressed: () {
                    // Get.to(mandipage());
                    _loginController.selectedIndex.value = 4;
                  },
                  icon: Icon(Icons.bar_chart,
                      color: Appcolor.greencolor, size: 35)),
            ],
          ),
        ),
      ),
    );
  }
}

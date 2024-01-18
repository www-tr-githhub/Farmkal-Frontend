import 'package:farmkal/Screens/mandi.dart';
import 'package:farmkal/Screens/productpage.dart';
import 'package:farmkal/Screens/seller.dart';
import 'package:farmkal/Screens/tractor_screen.dart';
import 'package:farmkal/app_localizations.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/controllers/login_controller.dart';
import 'package:farmkal/controllers/sellProductcontroller.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/recentmodel.dart';

import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:farmkal/view/onboarding.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/mandiController.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  ChatController _chatController = Get.find<ChatController>();
  MandiController _mandiController = Get.put(MandiController());
  LoginController _loginController = Get.put(LoginController());
  SellProductController _sellProductController =
      Get.put(SellProductController());

  Widget rowview(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                Get.to(tractor_Screen());
              },
              child: Image.asset(
                'assets/gif/Tractor.jpeg',
                width: 110,
                height: 80,
              )),
          Text(title),
        ],
      ),
    );
  }

  Widget mandiUp(String title) {
    return Row(
      children: [
        Icon(
          Icons.arrow_upward,
          color: Colors.green,
          size: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "₹14250/Quital",
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ],
    );
  }

  Widget mandiUp2(String title) {
    return Row(
      children: [
        Icon(
          Icons.arrow_upward,
          color: Colors.green,
          size: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "${_mandiController.mandiData.value.data?[0]}",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ],
    );
  }

  Widget mandidown(String title) {
    return Row(
      children: [
        Icon(
          Icons.arrow_downward,
          color: Colors.red,
          size: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "${_mandiController.commidtyData.value.commodity?["Ajwan"]}",
              style: TextStyle(fontSize: 14),
            )
          ],
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
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/gif/bluetractor.jpeg',
                    // width: 180,
                    // height: 120,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(title, style: TextStyle(fontSize: 10)),
                      Text(name),
                      Row(
                        children: [
                          Text(info, style: TextStyle(fontSize: 10)),
                          Icon(Icons.phone, size: 10)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _mandiController.getMandiData();
      // await _mandiController.getCommidityData();
      await _loginController.postloginUser();
      // await _sellProductController.getproductListData();
      await _sellProductController.getrecentproduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
            child: Obx(() {
              switch (_mandiController.rxRequestStatus.value) {
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Utils.SnackBar('No Internet', 'No Internet');
                case Status.COMPLETED:
                  return Container(
                    decoration: BoxDecoration(
                      color: Appcolor.browncolor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppBar(
                          backgroundColor: Appcolor.browncolor,
                          leading: InkWell(
                            onTap: () {
                              Get.to(PageControllerApp());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'),
                                radius: 20,
                              ),
                            ),
                          ),
                          title: Text("RAM KUMAR"),
                          actions: [
                            // Row(
                            //   children: [
                            IconButton(
                              icon:
                                  Icon(Icons.search), // This is the search icon
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.menu), // This is the menu icon
                              onPressed: () {},
                              //   )
                              // ],
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
                        Row(
                          children: [
                            Expanded(child: mandiUp("Garlic")),
                            Expanded(child: mandiUp("Garlic")),
                            Expanded(child: mandiUp("Garlic")),
                            // Expanded(
                            //   child: mandidown("अजवाइन"),
                            // ),
                            // Expanded(child: mandiUp2("सेब ")),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(8),
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Appcolor.darkbrowncolor),
                                child: Center(
                                  child: Text(
                                    "और देखे",
                                    style:
                                        TextStyle(color: Appcolor.whitecolor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
              }
            })),
        body:

            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            // ListTile(
            //   leading: CircleAvatar(
            //     backgroundImage:
            //         NetworkImage('https://via.placeholder.com/150'),
            //     radius: 20,
            //   ),
            //   title: Text("RAM KUMAR"),
            //   subtitle: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         mandi("गेहू "),
            //       ],
            //     ),
            //   ),
            //   trailing: Row(
            //     children: [
            //       IconButton(
            //         icon: Icon(Icons.search), // This is the search icon
            //         onPressed: () {},
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.menu), // This is the menu icon
            //         onPressed: () {},
            //       )
            //     ],
            //   ),
            // ),
            Obx(
          () {
            switch (_sellProductController.rxRequestStatus.value) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Utils.SnackBar('No Internet', 'No Internet');
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      AppLocalizations.of(context)!
                          .translate('Things available'),
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        rowview(
                            AppLocalizations.of(context)!.translate('Tractor')),
                        rowview(
                            AppLocalizations.of(context)!.translate('Trolly')),
                        rowview(AppLocalizations.of(context)!
                            .translate('Cultivator')),
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
                      AppLocalizations.of(context)!
                          .translate('Recently added items'),
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Expanded(child: filter('CHITTORGARH')),
                        Expanded(child: filter('MODEL 2015-2020')),
                        Expanded(child: filter('RANGE40-45HP')),
                        Expanded(
                          child: Container(
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
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: GridView.builder(
                        itemCount: _sellProductController
                            .getRecentproduct.value.product!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          /* Row(
                                  children: [
                                    Expanded(
                                        child: recentimage('2,50,000/ चित्तोडगढ़ ',
                                            'MAHINDRA ', '475 2015')),
                                    Expanded(
                                        child: recentimage('3,50,000/उदयपुर ',
                                            'SONALIKA ', '735DI 2019')),
                                  ],
                                ),*/
                          // Product _product = _sellProductController
                          //     .getRecentproduct.value.product![index];

                          return recentimage(
                              '2,50,000/ चित्तोडगढ़ ',
                              _sellProductController
                                  .getRecentproduct.value.product![index].name,
                              '475 2015');
                        },
                      ),
                    ),
                  ]),
                );
            }
          },
        )
        //   ],
        // ),
        // ),
        // bottomNavigationBar: Container(
        //   color: Appcolor.darkbrowncolor,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         /*Icon(Icons.account_circle_sharp,
        //               color: Appcolor.whitecolor, size: 35),*/

        //         IconButton(
        //             onPressed: () async {
        //               String? token = await UserPreference().getToken();
        //               print(token);
        //               if (token == null ||
        //                   token.isEmpty ||
        //                   _loginController.userDetails.value.user == null) {
        //                 print("hello tanisha");
        //                 showDialog(
        //                   context: context,
        //                   builder: (BuildContext context) {
        //                     return AlertDialog(
        //                       title: Text('Login'),
        //                       content: Column(
        //                         mainAxisSize: MainAxisSize.min,
        //                         children: <Widget>[
        //                           Text(
        //                               "You have to login or Register first to start chatting")
        //                         ],
        //                       ),
        //                       actions: <Widget>[
        //                         TextButton(
        //                           child: Text('Cancel'),
        //                           onPressed: () {
        //                             Navigator.of(context).pop();
        //                           },
        //                         ),
        //                         TextButton(
        //                           child: Text('Login'),
        //                           onPressed: () {
        //                             Get.to(() => PageControllerApp());
        //                           },
        //                         ),
        //                       ],
        //                     );
        //                   },
        //                 );
        //               } else {
        //                 Get.to(() => PageControllerApp());
        //               }
        //             },
        //             icon: Icon(Icons.account_circle_sharp,
        //                 color: Appcolor.whitecolor, size: 32)),
        //         IconButton(
        //           onPressed: () async {
        //             String? token = await UserPreference().getToken();
        //             print(token);
        //             if (token == null ||
        //                 token.isEmpty ||
        //                 _loginController.userDetails.value.user == null) {
        //               print("hello tanisha");
        //               showDialog(
        //                 context: context,
        //                 builder: (BuildContext context) {
        //                   return AlertDialog(
        //                     title: Text('Login'),
        //                     content: Column(
        //                       mainAxisSize: MainAxisSize.min,
        //                       children: <Widget>[
        //                         Text(
        //                             "You have to login or Register first to start chatting")
        //                       ],
        //                     ),
        //                     actions: <Widget>[
        //                       TextButton(
        //                         child: Text('Cancel'),
        //                         onPressed: () {
        //                           Navigator.of(context).pop();
        //                         },
        //                       ),
        //                       TextButton(
        //                         child: Text('Login'),
        //                         onPressed: () {
        //                           Get.to(() => PageControllerApp());
        //                         },
        //                       ),
        //                     ],
        //                   );
        //                 },
        //               );
        //             } else {
        //               // _chatController.connect("him1@g.com");
        //               Get.to(() => ChatPage());
        //             }
        //           },
        //           icon: Icon(Icons.chat_bubble, color: Colors.white, size: 35),
        //         ),
        //         IconButton(
        //             onPressed: () async {
        //               String? token = await UserPreference().getToken();
        //               print(token);
        //               if (token == null ||
        //                   token.isEmpty ||
        //                   _loginController.userDetails.value.user == null) {
        //                 print("hello tanisha");
        //                 showDialog(
        //                   context: context,
        //                   builder: (BuildContext context) {
        //                     return AlertDialog(
        //                       title: Text('Login'),
        //                       content: Column(
        //                         mainAxisSize: MainAxisSize.min,
        //                         children: <Widget>[
        //                           Text(
        //                               "You have to login or Register first to start chatting")
        //                         ],
        //                       ),
        //                       actions: <Widget>[
        //                         TextButton(
        //                           child: Text('Cancel'),
        //                           onPressed: () {
        //                             Navigator.of(context).pop();
        //                           },
        //                         ),
        //                         TextButton(
        //                           child: Text('Login'),
        //                           onPressed: () {
        //                             Get.to(() => PageControllerApp());
        //                           },
        //                         ),
        //                       ],
        //                     );
        //                   },
        //                 );
        //               } else {
        //                 Get.to(Sellerview());
        //               }
        //             },
        //             icon: Icon(Icons.add, color: Colors.white, size: 35)),
        //         GestureDetector(
        //             onTap: () {
        //               // _mandiController.getCityData();
        //               // _mandiController.getMarketDatamethod();
        //               // _mandiController.getCommidityData();
        //             },
        //             child: Icon(Icons.favorite, color: Colors.white, size: 35)),
        //         IconButton(
        //             onPressed: () {
        //               Get.to(mandipage());
        //             },
        //             icon: Icon(Icons.bar_chart,
        //                 color: Appcolor.greencolor, size: 35)),
        //       ],
        //     ),
        //   ),
        // ),
        );
    // }
    // }),
    // );
  }
}

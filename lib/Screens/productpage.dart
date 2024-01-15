import 'dart:ffi';

import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/Screens/mandi.dart';
import 'package:farmkal/Screens/seller.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Productpage extends StatefulWidget {
  @override
  _ProductpageState createState() => _ProductpageState();
}

/*class TableController extends GetxController {
  var rows = List<DataRow>.generate(
    4,
    (index) => DataRow(
      cells: [
        DataCell(Text('Cell ${index + 1},1')),
        DataCell(Text('Cell ${index + 1},2')),
      ],
    ),
  ).obs;
}*/

class _ProductpageState extends State<Productpage> {
  ChatController _chatController = Get.find<ChatController>();

  //final controller = Get.put(TableController());

  Widget buttonbox(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50,
          width: 100,
          color: Colors.brown,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, color: Appcolor.whitecolor),
            ),
          )),
    );
  }

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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "SONALIKA \n735DI 2019",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 150),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "3,50,000 \nउदयपुर ",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            Container(
              child: Image.asset('assets/gif/bluetractor.jpeg'),
            ),
            Row(
              children: [
                SizedBox(width: 100),
                buttonbox("कॉल करे"),
                InkWell(
                  child: buttonbox(" चैट करे "),
                  onTap: () {
                    Get.to(ChatPage());
                  },
                ),
              ],
            ),
            Text("SELLER - राम कुमार \nADDRESS - नई पुलिया के पास, उदयपुर "),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(180),
                border: TableBorder.all(width: 2.0, style: BorderStyle.solid),
                children: [
                  TableRow(children: [
                    Column(
                      children: [Text("मोडल ", style: TextStyle(fontSize: 20))],
                    ),
                    Column(
                      children: [Text("2019 ", style: TextStyle(fontSize: 20))],
                    )
                  ]),
                  TableRow(children: [
                    Column(
                      children: [Text("गंटे ", style: TextStyle(fontSize: 20))],
                    ),
                    Column(
                      children: [Text("2200", style: TextStyle(fontSize: 20))],
                    )
                  ]),
                  TableRow(children: [
                    Column(
                      children: [
                        Text("अन्य \nजानकारी ", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    Column(
                      children: [Text("")],
                    )
                  ])
                ],
              ),
            )
            /*Obx(
                () => DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Column 1',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Column 2',
                      ),
                    ),
                  ],
                  rows: controller.rows.value,
                ),
              ),*/
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: Appcolor.darkbrowncolor,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 10),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         IconButton(
      //             onPressed: () {
      //               Get.to(() => PageControllerApp());
      //             },
      //             icon: Icon(Icons.account_circle_sharp,
      //                 color: Appcolor.whitecolor, size: 32)),
      //         IconButton(
      //           onPressed: () {
      //             // _chatController.connect("him1@g.com");
      //             Get.to(() => ChatPage());
      //           },
      //           icon: Icon(Icons.chat_bubble, color: Colors.white, size: 35),
      //         ),
      //         IconButton(
      //             onPressed: () {
      //               Get.to(Sellerview());
      //             },
      //             icon: Icon(Icons.add, color: Colors.white, size: 35)),
      //         //Icon(Icons.add, color: Colors.white, size: 35),
      //         Icon(Icons.favorite, color: Colors.white, size: 35),
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
  }
}

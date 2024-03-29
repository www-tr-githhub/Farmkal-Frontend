import 'package:farmkal/Screens/chat.dart';
import 'package:farmkal/Screens/seller.dart';
import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/controllers/mandiController.dart';
import 'package:farmkal/controllers/sellProductcontroller.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class tractor_Screen extends StatefulWidget {
  @override
  _tractor_ScreenState createState() => _tractor_ScreenState();
}

class _tractor_ScreenState extends State<tractor_Screen> {
  ChatController _chatController = Get.find<ChatController>();
  SellProductController _sellProductController =
      Get.put(SellProductController());
  Widget rowview(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            'assets/gif/Tractor.jpeg',
            width: 150,
            height: 120,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget rowview2() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            rowview("Tractor1"),
            rowview("Tractor1"),
            rowview("Tractor1"),
            rowview("Tractor1"),
            rowview("Tractor1"),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _sellProductController.getproductListData();
    });
  }

  @override
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
      body: Obx(() {
        switch (_sellProductController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Utils.SnackBar('No Internet', 'No Internet');
          case Status.COMPLETED:
            print(
                "sorry tanisha ${_sellProductController.productListData.value.products!.length}");
            return GridView.builder(
              itemCount:
                  _sellProductController.productListData.value.products!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                // return Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     rowview2(),
                return Column(
                  children: [
                    (_sellProductController.productListData.value
                                .products![index].images!.isNotEmpty &&
                            _sellProductController.productListData.value
                                .products![index].images![0].url!.isNotEmpty)
                        ? Image.network(_sellProductController.productListData
                            .value.products![index].images![0].url!)
                        : Image.asset(
                            'assets/gif/Tractor.jpeg',
                            width: 150,
                            height: 120,
                          ),
                    Text(
                        "${_sellProductController.productListData.value.products![index].name}",
                        style: TextStyle(color: Colors.black)),
                    Text(
                        "${_sellProductController.productListData.value.products![index].city}",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                    Text(
                        "${_sellProductController.productListData.value.products![index].price}",
                        style: TextStyle(color: Colors.black, fontSize: 14))
                  ],
                );
                ;
                //   ],
                // );
              },
            );
        }
      }),
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
      //         Icon(Icons.favorite, color: Colors.white, size: 35),
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(Icons.bar_chart,
      //                 color: Appcolor.greencolor, size: 35)),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

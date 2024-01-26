import 'package:farmkal/controllers/imagecontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePickerController _pickerController = Get.put(ImagePickerController());
  @override
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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Obx(() {
                  if (_pickerController.pickedImage.value.path != '') {
                    return CircleAvatar(
                      backgroundImage:
                          FileImage(_pickerController.pickedImage.value),
                      radius: 80,
                    );
                  } else {
                    return InkWell(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors
                                .black, // Set your desired border color here.
                            width: 2.0, // Set your desired border width here.
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/gif/Farmkal.gif"),
                          radius: 80,
                        ),
                      ),
                      onTap: () {
                        _pickerController.pickImage();
                      },
                    );
                  }
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  )),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your name",
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: const Color.fromARGB(255, 61, 57, 57))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  )),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Address",
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: const Color.fromARGB(255, 61, 57, 57))),
              ),
            ),
            Container(
              child: Row(children: [
                InkWell(child: buttonbox("My Orders"),
                onTap: (){},
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

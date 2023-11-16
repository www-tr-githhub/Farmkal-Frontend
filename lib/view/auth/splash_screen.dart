import 'dart:io';

import 'package:farmkal/Screens/Home_screen.dart';
import 'package:farmkal/data/app_exceptions.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:farmkal/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getFirebaseMessagingToken();
    super.initState();
  }

  Future<void> getFirebaseMessagingToken() async {
    print("Tanisha");
    Future.delayed(const Duration(milliseconds: 3350), () {
      Get.to(() => Home_Screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0019),
      body: PageView.builder(itemBuilder: (context, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
                width: 200,
                height: 200,
                child: Image(image: AssetImage('assets/gif/Farmkal.gif'))),
          ),
        );
      }),
    );
  }
}

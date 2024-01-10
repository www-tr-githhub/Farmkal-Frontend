import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class T_Controller extends GetxController {
  // TextEditingController textEditingController = TextEditingController();
  final model = TextEditingController().obs;
  final brand = TextEditingController().obs;
  final tyre = TextEditingController().obs;
  final rate= TextEditingController().obs;
  final hour = TextEditingController().obs;
  final otherdetail = TextEditingController().obs;

}

  

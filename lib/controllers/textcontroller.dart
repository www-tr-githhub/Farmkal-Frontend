import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class T_Controller extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  @override
void dispose() {
  textEditingController.dispose();
  super.dispose();
}
}


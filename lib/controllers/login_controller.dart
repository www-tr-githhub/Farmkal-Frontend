import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/view/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString phoneNo = ''.obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  RxBool loading = false.obs;
  final phoneNoController = TextEditingController().obs;
  RxString otpController = "".obs;
  updatePhoner(phone) {
    phoneNo.value = phone;
  }


  void sendOtp() {
    //Get.to(RouteName.verifyOtp); ---> make the verify-otp.dart page then it will navigate
    Get.to(OtpScreen());
  }
  void verifyOtp() {
    //Get.toNamed(RouteName.verifyOtp); ---> make the verify-otp.dart page then it will navigate
  }

}

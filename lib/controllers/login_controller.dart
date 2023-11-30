import 'package:farmkal/Screens/Home_screen.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/view/auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString phoneNo = ''.obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  RxBool loading = false.obs;
  final phoneNoController = TextEditingController().obs;
  RxString otpController = "".obs;
  updatePhoner(phone) {
    phoneNo.value = phone;
  }

  // void sendOtp() {
  //   //Get.to(RouteName.verifyOtp); ---> make the verify-otp.dart page then it will navigate
  //   Get.to(OtpScreen());
  // }

  void verifyOtp(String verificationId) {
    String smscode = otpController.value;
    PhoneAuthCredential _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smscode);
    auth.signInWithCredential(_credential).then((result) {
      if (result != null) {
        Get.to(Home_Screen());
      }
    }).catchError((e) {
      print(e);
    });
  }

  void signInWithMobileNumber() async {
    loading.value = true;
    setRxRequestStatus(Status.LOADING);
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNo.value,
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            await _auth.signInWithCredential(authCredential).then((value) {
              print("verified");
              loading.value = false;
              setRxRequestStatus(Status.COMPLETED);
            });
          },
          verificationFailed: ((error) {
            print(error);
          }),
          codeSent: (String verificationId, [int? forceResendingToken]) {
            Get.to(OtpScreen(
              verificationId: verificationId,
            ));
            loading.value = false;
            setRxRequestStatus(Status.COMPLETED);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          timeout: Duration(seconds: 45));
    } catch (e) {
      print(" error ---> ${e.toString()}");
    }
  }
}

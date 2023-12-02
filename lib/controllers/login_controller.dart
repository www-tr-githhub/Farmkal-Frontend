import 'package:farmkal/Screens/Home_screen.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/view/auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  updateOtp(phone) {
    otpController.value = phone;
  }

  // void sendOtp() {
  //   //Get.to(RouteName.verifyOtp); ---> make the verify-otp.dart page then it will navigate
  //   Get.to(OtpScreen());
  // }

  void verifyOtp(String verificationId) {
    print("${otpController.value}");
    print("verify otp");
    loading.value = true;
    setRxRequestStatus(Status.LOADING);
    String smscode = otpController.value;
    PhoneAuthCredential _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smscode);
    auth.signInWithCredential(_credential).then((result) {
      if (result != null) {
        Get.to(Home_Screen());
        loading.value = false;
        setRxRequestStatus(Status.COMPLETED);
      }
    }).catchError((e) {
      print("${e}, error occured");
      loading.value = false;
      setRxRequestStatus(Status.COMPLETED);
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
            loading.value = false;
            setRxRequestStatus(Status.COMPLETED);
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
      loading.value = false;
      setRxRequestStatus(Status.COMPLETED);
    }
  }

  void googleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return; // If no account is selected, return

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
      Get.offAll(Home_Screen());
    } catch (e) {
      Get.snackbar("Error signing in with Google", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

import 'package:farmkal/Screens/Home_screen.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/userdata-model.dart';
import 'package:farmkal/services/login_services.dart';
import 'package:farmkal/view/auth/otp_screen.dart';
import 'package:farmkal/view_models/userPrefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _api = LoginServices();

  UserPreference _userPreference = new UserPreference();
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

  Rx<String> tan = "".obs;
  String tanisha = "";

  Rx<Userdata> userDetails = Userdata().obs;
  void setUserdata(Userdata value) => userDetails.value = value;

  // void sendOtp() {
  //   //Get.to(RouteName.verifyOtp); ---> make the verify-otp.dart page then it will navigate
  //   Get.to(OtpScreen());
  // }

  Rx<String> username = "".obs;
  Rx<String> phone = "".obs;
  Rx<String> userbio = "".obs;
  Rx<String> userstate = "".obs;
  Rx<String> usercity = "".obs;

  void postRegisterUser() async {
    loading.value = true;
    setRxRequestStatus(Status.LOADING);
    var data = {
      "name": "Himanshu",
      "phone": phoneNo.value.split('+91')[1],
      "bio": "This is my bio",
      "state": "Rajasthan",
      "city": "churu",
      "latitude": "26.0045",
      "longitude": "75.5432"
    };

    print(data);

    try {
      final response = await _api.postRegister(data);
      setUserdata(response);
      _userPreference.saveToken(userDetails.value.token!);
      Get.to(Home_Screen());
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
      Get.snackbar("Congratulations", "You are successfully registered");
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }

  void postloginUser() async {
    loading.value = true;
    setRxRequestStatus(Status.LOADING);
    var data = {
      "name": "Himanshu",
      "phone": phoneNo.value.split('+91')[1],
      "bio": "This is my bio",
      "state": "Rajasthan",
      "city": "churu",
      "latitude": "26.0045",
      "longitude": "75.5432"
    };

    print(data);

    try {
      final response = await _api.postLogin(data);
      setUserdata(response);
      print(userDetails.value.token!);
      _userPreference.saveToken(userDetails.value.token!);
      Get.to(Home_Screen());
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
      Get.snackbar("Congratulations", "You are successfully registered");
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }

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
      print('Signed in with Google');
      Get.offAll(Home_Screen());
    } catch (e) {
      print('Error signing in with Google: $e');
      Get.snackbar("Error signing in with Google", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

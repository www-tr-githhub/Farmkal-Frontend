import 'dart:async';

import 'package:farmkal/controllers/login_controller.dart';
import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final LoginController loginController = Get.find<LoginController>();

  int timerDuration = 180; // 3 minutes in seconds
  Timer? timer;

  String otp = '';

  late int count;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    count = int.parse(loginController.phoneNoController.value.text);
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (timerDuration <= 0) {
        timer.cancel();
      } else {
        setState(() {
          timerDuration--;
        });
      }
    });
  }

  void resendOtp() {
    loginController.verifyOtp(widget.verificationId);

    timerDuration = 180;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Otp has been sent',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: const Color(0xff252525),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          text: 'Enter 4 digits OTP sent on ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff646464),
                          ),
                          children: [
                            TextSpan(
                              text: '+91 $count',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Appcolor.greencolor,
                              ),
                            ),
                            TextSpan(
                              text: ' to verify. ',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff646464),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      const SizedBox(height: 2),
                      //
                      GestureDetector(
                        onTap: () {
                          Get.back();

                          // ////////
                          // ////////
                        },
                        child: Text('Edit Phone Number',
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Appcolor.blueColor,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                //
                otpField(loginController),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.only(bottom: 25, left: 16, right: 16),
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: SizedBox(
            width: double.maxFinite,
            height: 100,
            child: loginController.loading.value == true
                ? const Center(child: CircularProgressIndicator())
                : Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        //
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Appcolor.greencolor,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Appcolor.greencolor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.1),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                        //
                        //
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (timerDuration <= 0) {
                                    resendOtp();
                                  }
                                },
                                child: Text(
                                  'Resend OTP',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff646464),
                                  ),
                                )),
                            //
                            //
                            RichText(
                              text: TextSpan(
                                text: timerDuration <= 0 ? '' : 'Wait for ',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff646464),
                                ),
                                children: [
                                  TextSpan(
                                    text: timerDuration <= 0
                                        ? ''
                                        : '${timerDuration.toString()} sec',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff252525),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //
                        //
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextButton(
                            onPressed: otp.length == 4
                                ? () {
                                    loginController
                                        .verifyOtp(widget.verificationId);
                                    // Get.toNamed(RouteName.location);
                                  }
                                : null,
                            style: TextButton.styleFrom(
                              backgroundColor: Appcolor.greencolor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.1),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        //
                        //
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget otpField(LoginController otpController) {
    return OTPTextField(
      length: 4,
      keyboardType: TextInputType.number,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 50,
      otpFieldStyle: OtpFieldStyle(
          backgroundColor: const Color(0xffffffff),
          borderColor: Appcolor.greencolor,
          focusBorderColor: const Color(0xffEFD5FF),
          enabledBorderColor: const Color(0xffEFD5FF),
          errorBorderColor: const Color(0xFFDA5151),
          disabledBorderColor: const Color(0xff646464)),
      style: const TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        setState(() {
          otp = pin;
        });
        //otpController.updateOtp(pin);
      },
    );
  }
}

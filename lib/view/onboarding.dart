import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmkal/Screens/Home_screen.dart';
import 'package:farmkal/controllers/login_controller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class PageControllerApp extends StatefulWidget {
  const PageControllerApp({super.key});

  @override
  _PageControllerAppState createState() => _PageControllerAppState();
}

class _PageControllerAppState extends State<PageControllerApp> {
  final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    bool _isButtonClickable = true;
    final bool _hasFocus = false;

    LoginController loginController = Get.put(LoginController());
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: MediaQuery.of(context).size.height * 0.48,
                  autoPlay: true, // Enable auto-play
                  autoPlayInterval:
                      Duration(seconds: 2), // Set interval to 2 seconds
                ),
                items: _pages.map((page) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: page,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () => loginController.googleSignIn(),
                child: Text('Sign In with Google'),
              ),
              // const SizedBox(height: 28),
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IntlPhoneField(
                  controller: loginController.phoneNoController.value,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight:
                        loginController.phoneNoController.value.text.length ==
                                10
                            ? FontWeight.w500
                            : FontWeight.w400,
                    color: const Color(0xff252525),
                  ),
                  decoration: InputDecoration(
                    errorStyle: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFDA5151)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                            color: Color(0xFFDA5151), width: 3)),
                    //
                    hintText: "Phone number",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff646464),
                    ),
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xff646464)),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    //
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffEFD5FF), width: 3),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    //
                    //filled: !_hasFocus &&
                    // LoginController.phoneNoController.value.text.length ==10,
                    //
                    fillColor: const Color(0xffEFD5FF),
                    //
                  ),
                  // initialCountryCode: 'IN',
                  initialValue: '+91',
                  validator: (phone) {
                    if (phone!.completeNumber.length == 13) {
                      setState(() {
                        _isButtonClickable = true;
                      });
                      // return null; // Phone number is valid
                    } else {
                      setState(() {
                        _isButtonClickable = false;
                      });
                      return 'Please enter a 10-digit phone number';
                    }
                    return null;
                  },
                  onChanged: (phone) {
                    loginController.updatePhoner(phone.completeNumber);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(() => BottomAppBar(
              padding: const EdgeInsets.only(bottom: 25, right: 20),
              color: Color.fromARGB(255, 196, 223, 246),
              surfaceTintColor: Colors.transparent,
              child: SizedBox(
                width: double.maxFinite,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: FloatingActionButton(
                          backgroundColor: Appcolor.greencolor,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          onPressed: () {
                            Get.to(Home_Screen());
                          },
                        ),
                      ),
                    ),
                    loginController.loading.value == true
                        ? const Center(child: CircularProgressIndicator())
                        : Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: FloatingActionButton(
                                    backgroundColor: Appcolor.greencolor,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    shape: CircleBorder(),
                                    onPressed: _isButtonClickable
                                        ? () {
                                            if (loginController
                                                .phoneNo.value.isNotEmpty) {
                                              loginController
                                                  .signInWithMobileNumber();
                                            } else {
                                              Get.snackbar(
                                                  "Please Enter your phone number",
                                                  "Enter your phone number to login");
                                            }
                                          }
                                        : null,
                                  )),
                            ),
                          ),
                  ],
                ),
              ),
            )));
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            /* child: Image.asset('assets/images/welcome-screen1.png',
                height: MediaQuery.of(context).size.height * 0.40),*/
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Your One-Stop-Shop for ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF252525),
                  fontSize: 26,
                ),
                children: [
                  TextSpan(
                    text: 'Buying ',
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 91, 13, 89),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF252525),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: 'Reselling ',
                    style: GoogleFonts.poppins(
                        textStyle: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 91, 13, 89),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    )),
                  ),
                  TextSpan(
                    text: 'excellence.',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF252525),
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 30),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Snap & Search:',
              style: GoogleFonts.poppins(
                color: Appcolor.greencolor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'Instant MeetupInstantly find farming products with a quick picture upload - meet your needs effortlessly.',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF252525),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              /*child: Image.asset(
                'assets/images/image1.png',
                cacheHeight: 350,
              ),*/
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              // child: Text(
              //   "Send Offers",
              //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              // ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                          text: 'FarmKal: ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            color: const Color(0xff252525),
                          )),
                      TextSpan(
                        text: 'Cultivate Your Potential',
                        style: TextStyle(
                          color: Color.fromARGB(255, 114, 30, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Farmkal:  ',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Appcolor.greencolor,
                    ),
                  ),
                  TextSpan(
                    text: 'Streamlining farmers tool transactions-',
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 47, 46, 46),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text:
                        'buy, sell, and trade with ease for a flourishing harvest.',
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 47, 46, 46),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Center(
                  /* child: Image.asset(
                  'assets/images/MeetInPerson.png',
                  cacheHeight: 350,
                ),*/
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              // child: Text(
              //   "Send Offers",
              //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              // ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Buy Smart, ',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 3, 57, 20),
                        ),
                      ),
                      TextSpan(
                          text: 'Sell Smarter. ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: const Color(0xff252525),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Seamless transactions in the palm of your hand! ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromARGB(255, 47, 46, 46),
                      )),
                  TextSpan(
                    text: 'Contact Seller:',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Appcolor.greencolor,
                    ),
                  ),
                  TextSpan(
                    text:
                        'fostering direct communication for efficient exchanges',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromARGB(255, 47, 46, 46),
                    ),
                  ),
                ],
              ),
            ),
            //
            const SizedBox(height: 100),

            //
          ],
        ),
      ),
    );
  }
}

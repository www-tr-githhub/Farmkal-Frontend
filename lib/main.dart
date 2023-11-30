import 'package:farmkal/controllers/Chatcontroller.dart';
import 'package:farmkal/resources/resources/colors/app_color.dart';
import 'package:farmkal/resources/resources/routes/routes.dart';
import 'package:farmkal/resources/resources/routes/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.put(ChatController());
    return GetMaterialApp(
      initialRoute: RouteName.splashscreen,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            // Fixed code
            surfaceTintColor: Colors.transparent),
        primaryColor: Appcolor.greencolor, // ---> change this primary color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEFD5FF),
          surfaceTint: Colors.transparent,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      getPages: ApplicationRoutes.appRoutes().toList(),
    );
  }
}

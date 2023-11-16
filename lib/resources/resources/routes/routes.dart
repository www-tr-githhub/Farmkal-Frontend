import 'package:farmkal/resources/resources/routes/routes_name.dart';
import 'package:farmkal/view/auth/splash_screen.dart';
import 'package:get/get.dart';

class ApplicationRoutes {
  static appRoutes() => {
        GetPage(
            name: RouteName.splashscreen,
            page: () => SplashScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRight),
      };
}

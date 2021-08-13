import 'package:get/get.dart';
import 'package:yamstack/view/intro/intro.dart';
import 'package:yamstack/view/splash/splash.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: INTRO_SCREEN,
      page: () => IntroScreen(),
      binding: IntroBinding(),
    ),
  ];
}

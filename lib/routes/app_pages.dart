import 'package:get/get.dart';
import 'package:yamstack/view/home/home.dart';
import 'package:yamstack/view/intro/intro.dart';
import 'package:yamstack/view/signin/sign_in.dart';
import 'package:yamstack/view/signup/sign_up.dart';
import 'package:yamstack/view/splash/splash.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: SplashScreen.ROUTE,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: IntroScreen.ROUTE,
      page: () => IntroScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: SignInScreen.ROUTE,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: SignUpScreen.ROUTE,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: HomeScreen.ROUTE,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

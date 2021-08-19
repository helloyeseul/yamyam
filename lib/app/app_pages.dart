import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/intro/welcome/intro_screen.dart';
import 'package:yamstack/src/view/screens/main/main_binding.dart';
import 'package:yamstack/src/view/screens/main/main_screen.dart';
import 'package:yamstack/src/view/screens/intro/splash/splash_screen.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_binding.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_screen.dart';
import 'package:yamstack/src/view/screens/user/signup/sign_up_binding.dart';
import 'package:yamstack/src/view/screens/user/signup/sign_up_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: SplashScreen.ROUTE,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: IntroScreen.ROUTE,
      page: () => IntroScreen(),
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
      name: MainScreen.ROUTE,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/intro/splash/splash_screen.dart';
import 'package:yamstack/src/view/screens/intro/welcome/intro_screen.dart';
import 'package:yamstack/src/view/screens/main/main_binding.dart';
import 'package:yamstack/src/view/screens/main/main_screen.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_binding.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_screen.dart';
import 'package:yamstack/src/view/screens/user/signup/sign_up_binding.dart';
import 'package:yamstack/src/view/screens/user/signup/sign_up_screen.dart';

mixin AppPages {
  static final pages = [
    GetPage(
      name: SplashScreen.route,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: IntroScreen.route,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: SignInScreen.route,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: SignUpScreen.route,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: MainScreen.route,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}

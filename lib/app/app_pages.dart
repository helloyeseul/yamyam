import 'package:get/get.dart';
import 'package:yamstack/view/screens/intro/intro_screen.dart';
import 'package:yamstack/view/screens/join/join_binding.dart';
import 'package:yamstack/view/screens/join/join_screen.dart';
import 'package:yamstack/view/screens/main/main_binding.dart';
import 'package:yamstack/view/screens/main/main_screen.dart';
import 'package:yamstack/view/screens/signin/sign_in_binding.dart';
import 'package:yamstack/view/screens/signin/sign_in_screen.dart';
import 'package:yamstack/view/screens/splash/splash_screen.dart';
import 'package:yamstack/view/screens/validate/validate_binding.dart';
import 'package:yamstack/view/screens/validate/validate_screen.dart';

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
      name: JoinScreen.route,
      page: () => const JoinScreen(),
      binding: JoinBinding(),
    ),
    GetPage(
      name: ValidateScreen.route,
      page: () => const ValidateScreen(),
      binding: ValidateBinding(),
    ),
    GetPage(
      name: SignInScreen.route,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: MainScreen.route,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}

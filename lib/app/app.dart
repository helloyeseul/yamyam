import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/app/app_binding.dart';
import 'package:yamstack/app/app_pages.dart';
import 'package:yamstack/src/view/screens/intro/splash/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: SplashScreen.route,
        defaultTransition: Transition.downToUp,
        getPages: AppPages.pages,
        initialBinding: AppBinding(),
      );
}

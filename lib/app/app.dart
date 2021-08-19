import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/app/app_binding.dart';
import 'package:yamstack/app/app_pages.dart';
import 'package:yamstack/src/view/screens/intro/splash/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: SplashScreen.ROUTE,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        initialBinding: AppBinding(),
      );
}

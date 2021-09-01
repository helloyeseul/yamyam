import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/app/app_binding.dart';
import 'package:yamstack/app/app_pages.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';
import 'package:yamstack/view/screens/splash/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: NotoSans.size(16),
        ),
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
}

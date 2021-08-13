import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/splash/splash.dart';

import 'routes/routes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: SplashScreen.ROUTE,
        defaultTransition: Transition.fade,
        getPages: AppPages.routes,
      );
}

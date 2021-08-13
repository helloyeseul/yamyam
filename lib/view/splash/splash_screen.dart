import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/common/resources/R.dart';
import 'package:yamstack/view/intro/intro.dart';

class SplashScreen extends StatelessWidget {
  static const ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Get.offNamed(IntroScreen.ROUTE);
    });

    return Scaffold(
      backgroundColor: R.colors.yellow,
      body: Center(
        child: SvgPicture.asset(R.svgs.appLogo),
      ),
    );
  }
}

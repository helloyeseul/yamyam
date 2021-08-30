import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/screens/intro/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(IntroScreen.route);
    });

    return Scaffold(
      backgroundColor: ColorResource.yellow,
      body: Center(
        child: SvgPicture.asset('assets/svg/app_logo.svg'),
      ),
    );
  }
}

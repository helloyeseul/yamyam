import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/common/resources/R.dart';

import 'intro_controller.dart';

class IntroScreen extends GetView<IntroController> {
  static const ROUTE = '/intro';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Image.asset(
              R.images.introBackground,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(48.0)),
                  SvgPicture.asset(R.svgs.appLogo),
                  Padding(padding: EdgeInsets.all(16.0)),
                  SvgPicture.asset(R.svgs.introWelcomeText),
                  Padding(padding: EdgeInsets.all(48.0)),
                  InkWell(
                    child: SvgPicture.asset(R.svgs.introSignInBtn),
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  InkWell(
                    child: SvgPicture.asset(R.svgs.introSignUpBtn),
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  InkWell(
                    child: SvgPicture.asset(R.svgs.introAnonymous),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

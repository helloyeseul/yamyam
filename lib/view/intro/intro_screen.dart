import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/common/resources/R.dart';
import 'package:yamstack/view/home/home.dart';
import 'package:yamstack/view/signin/sign_in.dart';
import 'package:yamstack/view/signup/sign_up.dart';
import 'package:yamstack/view/widgets/image/cover_image.dart';
import 'package:yamstack/view/widgets/space/space.dart';

import 'intro_controller.dart';

class IntroScreen extends GetView<IntroController> {
  static const ROUTE = '/intro';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildBody(),
      );

  _buildBody() => Stack(
        children: [
          CoverImage.asset(R.images.introBackground),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Space.xLarge(),
                SvgPicture.asset(R.svgs.appLogo),
                Space.medium(),
                SvgPicture.asset(R.svgs.introWelcomeText),
                Space.xLarge(),
                InkWell(
                  onTap: () {
                    Get.toNamed(SignInScreen.ROUTE);
                  },
                  child: SvgPicture.asset(R.svgs.introSignInBtn),
                ),
                Space.medium(),
                InkWell(
                  onTap: () {
                    Get.toNamed(SignUpScreen.ROUTE);
                  },
                  child: SvgPicture.asset(R.svgs.introSignUpBtn),
                ),
                Space.medium(),
                InkWell(
                  onTap: () {
                    Get.offNamed(HomeScreen.ROUTE);
                  },
                  child: SvgPicture.asset(R.svgs.introAnonymous),
                ),
              ],
            ),
          )
        ],
      );
}

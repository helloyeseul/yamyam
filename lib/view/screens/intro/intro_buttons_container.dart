import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/button/round_button.dart';
import 'package:yamstack/view/common/components/button/round_outlined_button.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';
import 'package:yamstack/view/screens/main/main_screen.dart';
import 'package:yamstack/view/screens/signin/sign_in_screen.dart';
import 'package:yamstack/view/screens/signup/sign_up_screen.dart';

class IntroButtonsContainer extends StatelessWidget {
  const IntroButtonsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundButton(
            onPressed: () {
              Get.toNamed(SignInScreen.route);
            },
            text: '로그인',
            textColor: Colors.white,
            backgroundColor: ColorResource.yellow,
          ),
          const SizedBox(height: 16),
          RoundOutlinedButton(
            onPressed: () {
              Get.toNamed(SignUpScreen.route);
            },
            text: '회원가입',
          ),
          const SizedBox(height: 28),
          Center(
            child: InkWell(
              onTap: () {
                Get.offAllNamed(MainScreen.route);
              },
              child: Text(
                '둘러보기',
                style: NotoSans.size(12, color: Colors.white, underline: true),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';
import 'package:yamstack/view/screens/mypage/my_page_controller.dart';
import 'package:yamstack/view/screens/splash/splash_screen.dart';

class MyPageScreen extends GetView<MyPageController> {
  const MyPageScreen({Key? key}) : super(key: key);

  static const route = '/my_page';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: InkWell(
          onTap: () {
            Get.offAllNamed(SplashScreen.route);
          },
          child: Center(
            child: NotoSansText(
              '처음으로',
              size: 18,
              underline: true,
            ),
          ),
        ),
      );
}

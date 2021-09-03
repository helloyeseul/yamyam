import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/button/round_button.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';
import 'package:yamstack/view/screens/welcome/welcome_controller.dart';

@immutable
class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const route = '/welcome';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: NotoSansText(
            '회원가입',
            size: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NotoSansText('🤗', size: 32),
                  const SizedBox(height: 16),
                  NotoSansText('완료되었습니다', size: 28),
                  const SizedBox(height: 16),
                  NotoSansText(
                    '나만의 맛집 리스트를 작성해보세요',
                    size: 14,
                    color: ColorResource.grey_0xff959595,
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                height: 56,
                width: 500,
                child: RoundButton(
                  onPressed: controller.onPressNext,
                  text: '첫 리스트 작성하러 가기',
                  borderRadius: 0.0,
                  backgroundColor: ColorResource.yellow,
                ),
              ),
            ),
          ],
        ),
      );
}

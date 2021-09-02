import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';
import 'package:yamstack/view/screens/verify/verify_controller.dart';

@immutable
class VerifyScreen extends GetView<VerifyController> {
  const VerifyScreen({Key? key}) : super(key: key);

  static const route = '/verify';
  static const ARGUMENT_KEY_EMAIL = 'ARGUMENT_KEY_EMAIL';

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
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  NotoSansText(
                    controller.email,
                    size: 18,
                    color: ColorResource.grey_0xff696969,
                  ),
                  const SizedBox(height: 28),
                  NotoSansText(
                    '등록된 이메일로 인증번호가 발송되었습니다\n인증번호를 확인해주세요',
                    size: 16,
                    color: ColorResource.black_0xff202020,
                  ),
                  const SizedBox(height: 16),
                  NotoSansText(
                    '등록된 이메일로 발송된 인증번호 6자리를 입력해주세요',
                    size: 14,
                    color: ColorResource.grey_0xffd9d9d9,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            const Divider(
              height: 16,
              color: ColorResource.grey_0xffeeeeee,
              thickness: 16,
            ),
          ],
        ),
      );
}

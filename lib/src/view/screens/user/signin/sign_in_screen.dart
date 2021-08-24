import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/button/round_button.dart';
import 'package:yamstack/src/view/common/widgets/text/noto_sans_text.dart';
import 'package:yamstack/src/view/screens/main/main_screen.dart';
import 'package:yamstack/src/view/screens/user/signin/components/sign_in_form_component.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  static const route = '/sign_in';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('로그인'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SignInFormComponent(
                label: 'Email',
                hint: '이메일을 입력하세요.',
                controller: controller.emailTextController,
                onTextChanged: controller.onEmailChanged,
              ),
              const SizedBox(height: 24),
              SignInFormComponent(
                label: 'Password',
                hint: '비밀번호를 입력하세요.',
                controller: controller.passwordTextController,
                onTextChanged: controller.onPasswordChanged,
              ),
              const SizedBox(height: 56),
              Obx(
                () => RoundButton(
                  onPressed: controller.isAllFieldNotEmpty
                      ? controller.onSignInButtonClicked
                      : null,
                  text: '로그인',
                  backgroundColor: controller.isAllFieldNotEmpty
                      ? ColorResource.yellow
                      : ColorResource.grey_0xffd9d9d9,
                  textColor: controller.isAllFieldNotEmpty
                      ? ColorResource.white
                      : ColorResource.black_0xff202020.withAlpha(20),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: NotoSansText(
                  '비밀번호 찾기',
                  size: 14,
                  color: ColorResource.grey_0xff696969,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.offAllNamed(MainScreen.route);
                  },
                  child: NotoSansText(
                    '둘러보기',
                    size: 12,
                    color: ColorResource.grey_0xffd9d9d9,
                    underline: true,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

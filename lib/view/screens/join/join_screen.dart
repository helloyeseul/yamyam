import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/button/round_button.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';
import 'package:yamstack/view/screens/join/components/join_form_component.dart';
import 'package:yamstack/view/screens/join/join_controller.dart';

@immutable
class JoinScreen extends GetView<JoinController> {
  const JoinScreen({Key? key}) : super(key: key);

  static const route = '/join';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: NotoSansText(
            '회원가입',
            size: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NotoSansText(
                      '필수정보',
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorResource.grey_0xff696969,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => JoinFormComponent(
                        label: '이메일',
                        hint: '이메일을 입력해주세요',
                        error: controller.joinForm.emailFormatError,
                        controller: controller.textControllers[Field.email]!,
                        onTextChanged: controller.onEmailChanged,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        Obx(
                          () => JoinFormComponent(
                            label: '닉네임',
                            hint: '닉네임을 입력해주세요',
                            error: controller.joinForm.nameFormatError,
                            controller: controller.textControllers[Field.name]!,
                            onTextChanged: controller.onNameChanged,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 30,
                          height: 36,
                          width: 72,
                          child: RoundButton(
                            onPressed: controller.onPressNameCheck,
                            text: '중복확인',
                            borderRadius: 36,
                            textSize: 14,
                            backgroundColor: ColorResource.black_0xff202020,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => JoinFormComponent(
                        label: '비밀번호',
                        hint: '비밀번호를 입력해주세요',
                        error: controller.joinForm.passwordFormatError,
                        controller: controller.textControllers[Field.password]!,
                        onTextChanged: controller.onPasswordChanged,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => JoinFormComponent(
                        label: '비밀번호 재확인',
                        hint: '비밀번호를 입력해주세요',
                        error: controller.joinForm.passwordRepeatError,
                        controller:
                            controller.textControllers[Field.passwordRepeat]!,
                        onTextChanged: controller.onPasswordRepeatChanged,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Container(
                height: 20,
                color: ColorResource.grey_0xffeeeeee,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NotoSansText(
                      '약관동의',
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorResource.grey_0xff696969,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NotoSansText(
                          '전체 동의',
                          size: 16,
                          color: ColorResource.grey_0xff696969,
                          underline: true,
                        ),
                        Obx(
                          () => Checkbox(
                            value: controller.joinForm.isAgreeWithTerms,
                            onChanged: controller.onPressAgreeWithTerms,
                            tristate: false,
                            visualDensity: VisualDensity.compact,
                            activeColor: Colors.black,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: ColorResource.grey_0xffeeeeee,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: SizedBox(
                  height: 56,
                  width: 500,
                  child: RoundButton(
                    onPressed: controller.onPressJoin,
                    text: '회원가입',
                    borderRadius: 0.0,
                    backgroundColor: ColorResource.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: const Center(child: Text('WelcomeScreen')),
      );
}

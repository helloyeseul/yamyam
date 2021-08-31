import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/join/join_controller.dart';

@immutable
class JoinScreen extends GetView<JoinController> {
  const JoinScreen({Key? key}) : super(key: key);

  static const route = '/join';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('회원가입'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('필수정보'),
            ],
          ),
        ),
      );
}

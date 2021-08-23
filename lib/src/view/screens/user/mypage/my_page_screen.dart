import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/user/mypage/my_page_controller.dart';

class MyPageScreen extends GetView<MyPageController> {
  const MyPageScreen({Key? key}) : super(key: key);

  static const route = '/my_page';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('MyPageScreen'),
        ),
      );
}

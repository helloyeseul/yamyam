import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/user/mypage/my_page_controller.dart';

class MyPageScreen extends GetView<MyPageController> {
  static const ROUTE = '/my_page';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildBody(),
      );

  Widget _buildBody() => Center(
        child: Text('MyPageScreen'),
      );
}

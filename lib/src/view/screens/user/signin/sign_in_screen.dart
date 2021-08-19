import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  static const ROUTE = '/sign_in';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('로그인')),
      );
}

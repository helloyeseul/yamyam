import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/user/signup/sign_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  static const ROUTE = '/sign_up';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('회원가입')),
      );
}

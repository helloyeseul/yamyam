import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/signup/sign_up.dart';

class SignUpScreen extends GetView<SignUpController> {
  static const ROUTE = '/sign_up';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('회원가입')),
      );
}

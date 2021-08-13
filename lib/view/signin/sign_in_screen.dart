import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  static const ROUTE = '/sign_in';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('로그인')),
      );
}

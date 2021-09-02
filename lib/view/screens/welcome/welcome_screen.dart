import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/welcome/welcome_controller.dart';

@immutable
class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const route = '/welcome';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('WelcomeScreen')),
      );
}

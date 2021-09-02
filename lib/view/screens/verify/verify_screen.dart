import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/verify/verify_controller.dart';

@immutable
class VerifyScreen extends GetView<VerifyController> {
  const VerifyScreen({Key? key}) : super(key: key);

  static const route = '/verify';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('VerifyScreen')),
      );
}

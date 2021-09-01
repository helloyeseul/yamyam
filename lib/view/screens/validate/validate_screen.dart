import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/validate/validate_controller.dart';

@immutable
class ValidateScreen extends GetView<ValidateController> {
  const ValidateScreen({Key? key}) : super(key: key);

  static const route = '/validate';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('ValidateScreen')),
      );
}

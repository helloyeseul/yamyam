import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  static const ROUTE = '/home';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('홈')),
      );
}

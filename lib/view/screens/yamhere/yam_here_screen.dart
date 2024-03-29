import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/yamhere/yam_here_controller.dart';

class StoreListScreen extends GetView<StoreListController> {
  const StoreListScreen({Key? key}) : super(key: key);

  static const route = '/store_list';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('StoreListScreen'),
        ),
      );
}

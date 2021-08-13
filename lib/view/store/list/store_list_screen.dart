import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/store/list/store_list_controller.dart';

class StoreListScreen extends GetView<StoreListController> {
  static const ROUTE = '/store_list';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildBody(),
      );

  Widget _buildBody() => Center(
        child: Text('StoreListScreen'),
      );
}

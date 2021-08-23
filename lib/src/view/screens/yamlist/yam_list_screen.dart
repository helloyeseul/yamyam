import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yamstack/src/view/screens/yamlist/filter/filter_controller.dart';
import 'package:yamstack/src/view/screens/yamlist/list/yam_list_draggable_sheet.dart';
import 'package:yamstack/src/view/screens/yamlist/yam_list_background.dart';
import 'package:yamstack/src/view/screens/yamlist/yam_list_controller.dart';
import 'package:yamstack/src/view/screens/yamlist/yaminfo/yam_info_group.dart';

class YamListScreen extends GetView<YamListController> {
  static const ROUTE = '/yamlist';

  final listFilterController = GetInstance().find<FilterController>();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              // 배경
              const YamListBackground(),
              // 달성률
              YamInfoGroup(),
              // 얌리스트
              YamListDraggableSheet(),
            ],
          ),
        ),
      );
}

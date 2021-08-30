import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/yamlist/list/yam_list_draggable_sheet.dart';
import 'package:yamstack/view/screens/yamlist/yam_list_background.dart';
import 'package:yamstack/view/screens/yamlist/yam_list_controller.dart';
import 'package:yamstack/view/screens/yamlist/yaminfo/yam_info_group.dart';

class YamListScreen extends GetView<YamListController> {
  const YamListScreen({Key? key}) : super(key: key);

  static const String route = '/yamlist';

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: const [
              YamListBackground(),
              YamInfoGroup(),
              YamListDraggableSheet(),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_controller.dart';
import 'package:yamstack/src/view/screens/store/yamlist/widgets/scrollable_sheet.dart';
import 'package:yamstack/src/view/screens/store/yamlist/yam_list_controller.dart';

class YamListScreen extends GetView<YamListController> {
  static const ROUTE = '/yamlist';

  final listFilterController = GetInstance().find<FilterController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            _background,
            ScrollableSheet(),
          ],
        ),
      );

  Widget get _background => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, ColorResource.greyDark],
          ),
        ),
      );
}

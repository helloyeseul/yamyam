import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/common/resources/R.dart';
import 'package:yamstack/view/widgets/image/cover_image.dart';
import 'package:yamstack/view/yam/list/yam_list_controller.dart';

class YamListScreen extends GetView<YamListController> {
  static const ROUTE = '/yam_list';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildBody(),
      );

  Widget _buildBody() => Stack(
        children: [
          CoverImage.asset(R.images.get('home_bg.jpg')),
          Center(
            child: Text('YamListScreen'),
          )
        ],
      );
}

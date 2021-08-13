import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/common/resources/R.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  static const ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    final pageList = [
      Center(child: Text('얌얌리스트')),
      Center(child: Text('여기얌')),
      Center(child: Text('나얌')),
    ];

    return Obx(() => Scaffold(
          body: pageList[controller.currentPage.value],
          bottomNavigationBar: _buildBottomTab(),
        ));
  }

  BottomNavigationBar _buildBottomTab() => BottomNavigationBar(
        currentIndex: controller.currentPage.toInt(),
        selectedItemColor: R.colors.black,
        unselectedItemColor: R.colors.greyLight,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: [
          BottomNavigationBarItem(
            label: '얌얌리스트',
            icon: SvgPicture.asset(R.svgs.get('tab_home.svg')),
            activeIcon: SvgPicture.asset(R.svgs.get('tab_home_selected.svg')),
          ),
          BottomNavigationBarItem(
            label: '여기얌',
            icon: SvgPicture.asset(R.svgs.get('tab_pin.svg')),
            activeIcon: SvgPicture.asset(R.svgs.get('tab_pin_selected.svg')),
          ),
          BottomNavigationBarItem(
            label: '나얌',
            icon: SvgPicture.asset(R.svgs.get('tab_user.svg')),
            activeIcon: SvgPicture.asset(R.svgs.get('tab_user_select.svg')),
          ),
        ],
        onTap: controller.onPageSelected,
      );
}

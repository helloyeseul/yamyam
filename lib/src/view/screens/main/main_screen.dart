import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/main/main_controller.dart';
import 'package:yamstack/src/view/screens/main/widgets/bottom_navigation.dart';
import 'package:yamstack/src/view/screens/store/list/store_list_screen.dart';
import 'package:yamstack/src/view/screens/user/mypage/my_page_screen.dart';
import 'package:yamstack/src/view/screens/yamlist/yam_list_screen.dart';

class MainScreen extends GetView<MainController> {
  static const ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentPageIndex,
          children: [
            YamListScreen(),
            StoreListScreen(),
            MyPageScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/main/bottom_navigation.dart';
import 'package:yamstack/view/screens/main/main_controller.dart';
import 'package:yamstack/view/screens/mypage/my_page_screen.dart';
import 'package:yamstack/view/screens/yamhere/yam_here_screen.dart';
import 'package:yamstack/view/screens/yamlist/yam_list_screen.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentPageIndex,
          children: const [
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

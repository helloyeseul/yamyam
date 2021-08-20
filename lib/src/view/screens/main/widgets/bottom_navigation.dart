import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';
import 'package:yamstack/src/view/screens/main/main_controller.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  late final controller = GetInstance().find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow()],
      ),
      child: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentPageIndex,
          selectedItemColor: ColorResource.black,
          unselectedItemColor: ColorResource.greyDark,
          selectedLabelStyle: NotoSans.size(9, fontWeight: FontWeight.w500),
          unselectedLabelStyle: NotoSans.size(9, fontWeight: FontWeight.w500),
          items: [
            _navigationItem(
              '얌얌리스트',
              'assets/svg/tab_home.svg',
              'assets/svg/tab_home_selected.svg',
            ),
            _navigationItem(
              '여기얌',
              'assets/svg/tab_pin.svg',
              'assets/svg/tab_pin_selected.svg',
            ),
            _navigationItem(
              '나얌',
              'assets/svg/tab_user.svg',
              'assets/svg/tab_user_select.svg',
            ),
          ],
          onTap: controller.onPageSelected,
        ),
      ),
    );
  }

  BottomNavigationBarItem _navigationItem(
    String text,
    String unselectedIcon,
    String selectedIcon,
  ) =>
      BottomNavigationBarItem(
        label: text,
        icon: Container(
          padding: EdgeInsets.only(bottom: 4.0),
          child: SvgPicture.asset(unselectedIcon, width: 20, height: 20),
        ),
        activeIcon: Container(
          padding: EdgeInsets.only(bottom: 4.0),
          child: SvgPicture.asset(selectedIcon, width: 20, height: 20),
        ),
      );
}

import 'package:get/get.dart';

enum RoutePage { yamList, storeList, myPage }

class MainController extends GetxController {
  final _currentPage = RoutePage.yamList.obs;

  RoutePage get currentPage => _currentPage.value;

  int get currentPageIndex => RoutePage.values.indexOf(currentPage);

  void onPageSelected(int index) {
    _currentPage.value = RoutePage.values[index];
  }
}

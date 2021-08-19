import 'package:get/get.dart';

enum RoutePage { YamList, StoreList, MyPage }

class MainController extends GetxController {
  final _currentPage = RoutePage.YamList.obs;

  RoutePage get currentPage => _currentPage.value;

  int get currentPageIndex => RoutePage.values.indexOf(currentPage);

  void onPageSelected(int index) {
    _currentPage.value = RoutePage.values[index];
  }
}

import 'package:get/get.dart';
import 'package:yamstack/view/screens/main/main_controller.dart';
import 'package:yamstack/view/screens/mypage/my_page_controller.dart';
import 'package:yamstack/view/screens/yamhere/yam_here_controller.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_controller.dart';
import 'package:yamstack/view/screens/yamlist/search/search_controller.dart';
import 'package:yamstack/view/screens/yamlist/yam_list_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => YamListController());
    Get.lazyPut(() => FilterController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => StoreListController());
    Get.lazyPut(() => MyPageController());
  }
}

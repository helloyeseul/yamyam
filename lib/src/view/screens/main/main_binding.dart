import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/main/main_controller.dart';
import 'package:yamstack/src/view/screens/store/list/store_list_controller.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_controller.dart';
import 'package:yamstack/src/view/screens/store/yamlist/search/search_controller.dart';
import 'package:yamstack/src/view/screens/store/yamlist/yam_list_controller.dart';
import 'package:yamstack/src/view/screens/user/mypage/my_page_controller.dart';

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

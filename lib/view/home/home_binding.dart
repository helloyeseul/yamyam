import 'package:get/get.dart';
import 'package:yamstack/view/home/home.dart';
import 'package:yamstack/view/store/list/store_list_controller.dart';
import 'package:yamstack/view/user/mypage/my_page_controller.dart';
import 'package:yamstack/view/yam/list/yam_list_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => YamListController());
    Get.lazyPut(() => StoreListController());
    Get.lazyPut(() => MyPageController());
  }
}

import 'package:get/get.dart';
import 'package:yamstack/view/home/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

import 'package:get/get.dart';
import 'package:yamstack/view/screens/join/join_controller.dart';

class JoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinController(Get.find()));
  }
}

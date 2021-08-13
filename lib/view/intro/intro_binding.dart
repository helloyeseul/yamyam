import 'package:get/get.dart';
import 'package:yamstack/view/intro/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}

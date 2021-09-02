import 'package:get/get.dart';
import 'package:yamstack/view/screens/verify/verify_controller.dart';

class VerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyController());
  }
}

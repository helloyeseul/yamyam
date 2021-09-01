import 'package:get/get.dart';
import 'package:yamstack/view/screens/validate/validate_controller.dart';

class ValidateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ValidateController());
  }
}

import 'package:get/get.dart';
import 'package:yamstack/view/screens/signin/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}

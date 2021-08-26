import 'package:get/get.dart';
import 'package:yamstack/src/data/repository/user/login/user_repository.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController(Get.find<UserRepository>()));
  }
}

import 'package:get/get.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/screens/verify/verify_screen.dart';

class VerifyController extends GetxController {
  VerifyController(this._repository);

  final UserLoginRepository _repository;

  final email = Get.arguments[VerifyScreen.ARGUMENT_KEY_EMAIL].toString();
}

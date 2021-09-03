import 'package:get/get.dart';
import 'package:yamstack/view/screens/main/main_screen.dart';

class WelcomeController extends GetxController {
  void onPressNext() {
    Get.offAllNamed(MainScreen.route);
  }
}

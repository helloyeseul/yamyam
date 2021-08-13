import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentPage = 0.obs;

  onPageSelected(int page) {
    currentPage.value = page;
  }
}

import 'package:get/get.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_item_button.dart';

class FilterController extends GetxController {
  final _currentType = FilterType.yam.obs;

  FilterType get currentFilter => _currentType.value;

  void onFilterClicked(final FilterType type) {
    _currentType(type);
  }
}

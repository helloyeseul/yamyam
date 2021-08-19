import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_item_button.dart';

class FilterController extends GetxController {
  final _currentType = FilterType.Yam.obs;

  FilterType get currentFilter => _currentType.value;

  void onFilterClicked(final FilterType type) {
    _currentType.value = type;
  }
}

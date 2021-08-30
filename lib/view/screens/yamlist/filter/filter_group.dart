import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_bottom_sheet.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_controller.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_item_button.dart';

class FilterGroup extends StatelessWidget {
  const FilterGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(const FilterBottomSheet());
      },
      child: Row(
        children: [
          Obx(() => Text(
              GetInstance()
                  .find<FilterController>()
                  .currentFilter
                  .toStringKor(),
              style: NotoSans.size(20))),
          const SizedBox(width: 8.0),
          SvgPicture.asset('assets/svg/arrow_down.svg', width: 16),
        ],
      ),
    );
  }
}

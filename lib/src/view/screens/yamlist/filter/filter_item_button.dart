import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';
import 'package:yamstack/src/view/screens/yamlist/filter/filter_controller.dart';

enum FilterType { Yam, Done }

extension ListTypeExtensions on FilterType {
  String toStringKor() {
    switch (this) {
      case FilterType.Yam:
        return '얌얌리스트';
      case FilterType.Done:
        return '완료얌';
    }
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key, required this.type}) : super(key: key);

  final FilterType type;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        GetInstance().find<FilterController>().onFilterClicked(type);
        Get.back();
      },
      splashColor: Colors.transparent,
      child: Obx(() {
        final controller = GetInstance().find<FilterController>();
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type.toStringKor(),
                style: NotoSans.size(
                  18,
                  color: controller.currentFilter == type
                      ? ColorResource.yellow
                      : ColorResource.black,
                ),
              ),
              controller.currentFilter == type
                  ? SvgPicture.asset('assets/svg/check.svg', width: 20)
                  : Container(),
            ],
          ),
        );
      }),
    );
  }
}

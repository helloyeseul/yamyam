import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_controller.dart';

enum FilterType { yam, done }

extension ListTypeExtensions on FilterType {
  String toStringKor() {
    switch (this) {
      case FilterType.yam:
        return '얌얌리스트';
      case FilterType.done:
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
                      : ColorResource.black_0xff202020,
                ),
              ),
              if (controller.currentFilter == type)
                SvgPicture.asset('assets/svg/check.svg', width: 20)
              else
                Container(),
            ],
          ),
        );
      }),
    );
  }
}

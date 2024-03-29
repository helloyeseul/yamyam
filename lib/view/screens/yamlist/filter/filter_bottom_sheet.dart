import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/button/round_outlined_button.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_item_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: 300,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                '리스트 필터',
                style: NotoSans.size(18, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
                height: 1, color: ColorResource.grey_0xffd9d9d9, thickness: 1),
            const SizedBox(height: 12),
            const FilterButton(type: FilterType.yam),
            const FilterButton(type: FilterType.done),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: RoundOutlinedButton(
                onPressed: () {
                  Get.back();
                },
                text: '닫기',
                textColor: ColorResource.black_0xff202020,
                borderColor: ColorResource.grey_0xffd9d9d9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

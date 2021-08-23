import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/button/round_outlined_button.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';
import 'package:yamstack/src/view/screens/yamlist/filter/filter_item_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
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
            const Divider(height: 1, color: ColorResource.grey, thickness: 1),
            SizedBox(height: 12),
            FilterButton(type: FilterType.Yam),
            FilterButton(type: FilterType.Done),
            SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: RoundOutlinedButton(
                onPressed: () {
                  Get.back();
                },
                text: '닫기',
                textColor: ColorResource.black,
                borderColor: ColorResource.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';

class YamInfoGroup extends StatelessWidget {
  const YamInfoGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: Get.mediaQuery.size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('이 구역 맛집 좀 아는', style: NotoSans.size(22)),
          Text(
            '얌얌박사 😎',
            style: NotoSans.size(28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 28),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 28, left: 16, right: 16, bottom: 16),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('달성률 64%', style: NotoSans.size(16)),
                  ),
                  const SizedBox(height: 12),
                  const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: LinearProgressIndicator(
                      value: 0.6,
                      color: ColorResource.yellow,
                      backgroundColor: ColorResource.grey_0xffd9d9d9,
                      minHeight: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

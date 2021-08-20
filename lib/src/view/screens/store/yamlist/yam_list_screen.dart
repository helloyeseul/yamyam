import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_controller.dart';
import 'package:yamstack/src/view/screens/store/yamlist/widgets/scrollable_sheet.dart';
import 'package:yamstack/src/view/screens/store/yamlist/widgets/yam_list_background.dart';
import 'package:yamstack/src/view/screens/store/yamlist/yam_list_controller.dart';

class YamListScreen extends GetView<YamListController> {
  static const ROUTE = '/yamlist';

  final listFilterController = GetInstance().find<FilterController>();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              YamListBackground(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('이 구역 맛집 좀 아는', style: NotoSans.size(22)),
                              Text(
                                '얌얌박사 😎',
                                style: NotoSans.size(28,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset('assets/svg/yam_list_bg.svg'),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
                            SizedBox(height: 12),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              child: LinearProgressIndicator(
                                value: 0.6,
                                color: ColorResource.yellow,
                                backgroundColor: ColorResource.grey,
                                minHeight: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ScrollableSheet(),
            ],
          ),
        ),
      );
}

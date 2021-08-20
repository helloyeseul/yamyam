import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_group.dart';
import 'package:yamstack/src/view/screens/store/yamlist/list/yam_list_item.dart';
import 'package:yamstack/src/view/screens/store/yamlist/search/search_group.dart';

class YamListGroup extends StatelessWidget {
  const YamListGroup({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowGlow();
        return true;
      },
      child: SingleChildScrollView(
        //ClampingScrollPhysics, BouncingScrollPhysics
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            FilterGroup(),
            SizedBox(height: 16),
            SearchGroup(),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => YamListItem(),
              separatorBuilder: (context, index) => const Divider(
                height: 20,
                thickness: 2,
                color: ColorResource.greyLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

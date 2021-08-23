import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/screens/yamlist/filter/filter_group.dart';
import 'package:yamstack/src/view/screens/yamlist/list/yam_list_item.dart';
import 'package:yamstack/src/view/screens/yamlist/search/search_group.dart';

class YamListView extends StatelessWidget {
  const YamListView({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var yamList = ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => YamListItem(),
      separatorBuilder: (context, index) => const Divider(
        height: 20,
        thickness: 2,
        color: ColorResource.greyLight,
      ),
    );

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        // 리스트 오버스크롤 해제
        notification.disallowGlow();
        return true;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 120,
            flexibleSpace: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(child: FilterGroup()),
                  const SizedBox(height: 16),
                  Expanded(child: SearchGroup()),
                ],
              ),
            ),
            floating: true,
            pinned: true,
          ),
          SliverList(delegate: SliverChildListDelegate([yamList])),
        ],
      ),
    );
  }
}

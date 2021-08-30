import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/screens/yamlist/filter/filter_group.dart';
import 'package:yamstack/view/screens/yamlist/list/yam_list_item.dart';
import 'package:yamstack/view/screens/yamlist/search/search_group.dart';

class YamListView extends StatelessWidget {
  const YamListView({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final yamList = ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => const YamListItem(),
      separatorBuilder: (context, index) => const Divider(
        height: 20,
        thickness: 2,
        color: ColorResource.grey_0xffeeeeee,
      ),
    );

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        // 리스트 오버스크롤 해제
        notification.disallowIndicator();
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
                children: const [
                  Expanded(child: FilterGroup()),
                  SizedBox(height: 16),
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

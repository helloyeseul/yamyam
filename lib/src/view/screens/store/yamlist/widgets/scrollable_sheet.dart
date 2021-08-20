import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_group.dart';
import 'package:yamstack/src/view/screens/store/yamlist/list/yam_list_item.dart';
import 'package:yamstack/src/view/screens/store/yamlist/search/search_group.dart';

class ScrollableSheet extends StatelessWidget {
  const ScrollableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          color: Colors.white,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
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
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, left: 16, right: 16),
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
              ],
            ),
          ),
        );
      },
    );
  }
}

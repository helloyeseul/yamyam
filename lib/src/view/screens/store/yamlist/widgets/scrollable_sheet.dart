import 'package:flutter/material.dart';
import 'package:yamstack/src/view/screens/store/yamlist/filter/filter_group.dart';
import 'package:yamstack/src/view/screens/store/yamlist/search/search_group.dart';

class ScrollableSheet extends StatelessWidget {
  const ScrollableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: NotificationListener<OverscrollIndicatorNotification>(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

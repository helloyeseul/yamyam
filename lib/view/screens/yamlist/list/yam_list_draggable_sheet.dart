import 'package:flutter/material.dart';
import 'package:yamstack/view/screens/yamlist/list/yam_list_view.dart';

class YamListDraggableSheet extends StatelessWidget {
  const YamListDraggableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          color: Colors.white,
          child: YamListView(scrollController: scrollController),
        );
      },
    );
  }
}

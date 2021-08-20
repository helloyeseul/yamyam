import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yamstack/resource/color_resource.dart';

class YamListBackground extends StatelessWidget {
  const YamListBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ColorResource.grey],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yamstack/resource/color_resource.dart';

class YamListBackground extends StatelessWidget {
  const YamListBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ColorResource.grey],
        ),
      ),
      child: Container(
        alignment: Alignment.topRight,
        child: SvgPicture.asset('assets/svg/yam_list_bg.svg'),
      ),
    );
  }
}

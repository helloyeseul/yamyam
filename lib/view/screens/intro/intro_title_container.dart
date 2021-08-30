import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';

class IntroTitleContainer extends StatelessWidget {
  const IntroTitleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/svg/app_logo.svg'),
        const SizedBox(height: 16),
        Text(
          '나만의 맛집 리스트, 얌스택',
          style: NotoSans.size(
            16,
            color: Colors.white,
            letterSpacing: 5,
          ),
        ),
      ],
    );
  }
}

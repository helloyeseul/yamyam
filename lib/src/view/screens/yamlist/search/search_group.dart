import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';
import 'package:yamstack/src/view/screens/yamlist/search/search_controller.dart';

class SearchGroup extends StatelessWidget {
  const SearchGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: TextField(
              controller: GetInstance().find<SearchController>().textController,
              style: NotoSans.size(16),
              cursorColor: ColorResource.greyDark,
              decoration: InputDecoration(
                border: _border,
                disabledBorder: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/search.svg',
                    color: ColorResource.greyDark,
                  ),
                ),
                hintText: '검색어를 입력하세요',
                hintStyle: NotoSans.size(16, color: ColorResource.grey),
              ),
              onChanged: GetInstance().find<SearchController>().onTextChanged,
            ),
          ),
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          'assets/svg/filter.svg',
          width: 20,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }

  InputBorder get _border => const OutlineInputBorder(
      borderSide: BorderSide(color: ColorResource.grey, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8)));
}

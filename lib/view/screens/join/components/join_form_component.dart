import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/text/fontstyle/noto_sans.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';

class JoinFormComponent extends StatelessWidget {
  const JoinFormComponent({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.onTextChanged,
    this.error,
  }) : super(key: key);

  final String label;
  final String hint;
  final String? error;
  final TextEditingController controller;
  final void Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    final hintStyle = NotoSans.size(
      16,
      color: ColorResource.grey_0xff959595,
      fontWeight: FontWeight.w500,
    );
    final errorStyle = NotoSans.size(
      12,
      color: ColorResource.red,
      fontWeight: FontWeight.w400,
    );

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: NotoSansText(label, size: 16),
        ),
        TextField(
          controller: controller,
          style: NotoSans.size(16, color: ColorResource.black_0xff202020),
          cursorColor: ColorResource.grey_0xff959595,
          decoration: InputDecoration(
            border: _border,
            disabledBorder: _border,
            enabledBorder: _border,
            focusedBorder: _focusedBorder,
            errorBorder: _errorBorder,
            errorStyle: errorStyle,
            errorText: error,
            hintText: hint,
            hintStyle: hintStyle,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: onTextChanged,
        ),
      ],
    );
  }

  InputBorder get _border => const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResource.grey_0xffd9d9d9, width: 1),
      );

  InputBorder get _focusedBorder => const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResource.black_0xff202020, width: 1),
      );

  InputBorder get _errorBorder => const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResource.red, width: 1),
      );
}

import 'package:flutter/material.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';

class SignInFormComponent extends StatelessWidget {
  const SignInFormComponent({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.onTextChanged,
  }) : super(key: key);

  final String label;
  final String hint;
  final TextEditingController controller;
  final void Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    final hintStyle = NotoSans.size(
      16,
      color: ColorResource.grey_0xffd9d9d9,
      fontWeight: FontWeight.w500,
    );

    return TextField(
      controller: controller,
      style: NotoSans.size(16, color: ColorResource.black_0xff202020),
      cursorColor: ColorResource.grey_0xff959595,
      decoration: InputDecoration(
        border: _border,
        disabledBorder: _border,
        enabledBorder: _border,
        focusedBorder: _focusedBorder,
        labelText: label,
        labelStyle: hintStyle,
        hintText: hint,
        hintStyle: hintStyle,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onChanged: onTextChanged,
    );
  }

  InputBorder get _border => const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResource.grey_0xffd9d9d9, width: 1),
      );

  InputBorder get _focusedBorder => const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResource.black_0xff202020, width: 1),
      );
}
